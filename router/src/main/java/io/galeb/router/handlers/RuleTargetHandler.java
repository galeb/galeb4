/*
 * Copyright (c) 2014-2017 Globo.com - ATeam
 * All rights reserved.
 *
 * This source is subject to the Apache License, Version 2.0.
 * Please see the LICENSE file for more information.
 *
 * Authors: See AUTHORS file
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package io.galeb.router.handlers;

import io.galeb.core.entity.Pool;
import io.galeb.core.entity.Rule;
import io.galeb.core.entity.VirtualHost;
import io.galeb.core.rest.EnumRuleType;
import io.galeb.router.ResponseCodeOnError;
import io.galeb.router.configurations.ManagerClientCacheConfiguration.ManagerClientCache;
import io.undertow.server.HttpHandler;
import io.undertow.server.HttpServerExchange;
import io.undertow.server.handlers.IPAddressAccessControlHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;

import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

public class RuleTargetHandler implements HttpHandler {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final AtomicBoolean firstLoad = new AtomicBoolean(true);
    private final VirtualHost virtualHost;
    private final HttpHandler next;

    public RuleTargetHandler(final ManagerClientCache cache, final String virtualHostName) {
        this.virtualHost = cache.get(virtualHostName);
        Assert.notNull(virtualHost, "[ Virtualhost NOT FOUND ]");
        final PathGlobHandler pathGlobHandler = new PathGlobHandler();
        this.next = hasAcl() ? loadAcl(pathGlobHandler) : pathGlobHandler;
        pathGlobHandler.setDefaultHandler(loadRulesHandler(next));
    }

    @Override
    public void handleRequest(HttpServerExchange exchange) throws Exception {
        next.handleRequest(exchange);
    }

    public HttpHandler getNext() {
        return next;
    }

    private HttpHandler loadRulesHandler(HttpHandler next) {
        return new HttpHandler() {

            final PathGlobHandler pathGlobHandler = next instanceof PathGlobHandler ? (PathGlobHandler) next : (PathGlobHandler) ((IPAddressAccessControlHandler) next).getNext();

            @Override
            public synchronized void handleRequest(HttpServerExchange exchange) throws Exception {
                if (pathGlobHandler.getPaths().isEmpty()) {
                    loadRules();
                }
                if (!pathGlobHandler.getPaths().isEmpty()) {
                    if (firstLoad.getAndSet(false)) {
                        next.handleRequest(exchange);
                    } else {
                        ResponseCodeOnError.RULE_PATH_NOT_FOUND.getHandler().handleRequest(exchange);
                    }
                } else {
                    ResponseCodeOnError.RULES_EMPTY.getHandler().handleRequest(exchange);
                }
            }

            private void loadRules() {
                Set<Rule> rules = virtualHost.getRules();
                if (!rules.isEmpty()) {
                    for (Rule rule : rules) {
                        String order = Optional.ofNullable(rule.getProperties().get("order")).orElse(String.valueOf(Integer.MAX_VALUE));
                        String type = rule.getRuleType().getName();
                        Pool pool = rule.getPool();
                        String path = rule.getProperties().get("match");

                        logger.info("add rule " + rule.getName() + " [order:" + order + ", type:" + type + "]");

                        if (EnumRuleType.PATH.toString().equals(type)) {
                            final PoolHandler poolHandler = new PoolHandler(pool);
                            pathGlobHandler.addPath(path, Integer.parseInt(order), poolHandler);
                        }
                    }
                }
            }
        };
    }

    private boolean hasAcl() {
        return virtualHost.getProperties().containsKey("allow");
    }

    private HttpHandler loadAcl(PathGlobHandler pathGlobHandler) {
        final IPAddressAccessControlHandler ipAddressAccessControlHandler = new IPAddressAccessControlHandler().setNext(pathGlobHandler);

        Arrays.asList(virtualHost.getProperties().get("allow").split(","))
                .forEach(ipAddressAccessControlHandler::addAllow);
        ipAddressAccessControlHandler.setDefaultAllow(false);
        return ipAddressAccessControlHandler;
    }
}
