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

import io.galeb.router.ResponseCodeOnError;
import io.galeb.router.services.ExternalDataService;
import io.undertow.server.HttpHandler;
import io.undertow.server.HttpServerExchange;
import io.undertow.server.handlers.NameVirtualHostHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import static io.galeb.router.services.ExternalDataService.VIRTUALHOSTS_KEY;

public class NameVirtualHostDefaultHandler implements HttpHandler {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final ApplicationContext context;
    private final ExternalDataService data;

    public NameVirtualHostDefaultHandler(final ApplicationContext context, final ExternalDataService externalData) {
        this.context = context;
        this.data = externalData;
    }

    @Override
    public synchronized void handleRequest(HttpServerExchange exchange) throws Exception {
        if (!data.exist(VIRTUALHOSTS_KEY)) {
            logger.error(VIRTUALHOSTS_KEY + " not found");
            ResponseCodeOnError.ETCD_VIRTUALHOSTS_PATH_NOT_FOUND.getHandler().handleRequest(exchange);
            return;
        }
        final String hostName = exchange.getHostName();
        final NameVirtualHostHandler nameVirtualHostHandler = (NameVirtualHostHandler) context.getBean("nameVirtualHostHandler");
        if (isValid(hostName, nameVirtualHostHandler)) {
            logger.info("adding " + hostName);
            nameVirtualHostHandler.addHost(hostName, new RuleTargetHandler(data, hostName));
            nameVirtualHostHandler.handleRequest(exchange);
        } else {
            ResponseCodeOnError.VIRTUALHOST_NOT_FOUND.getHandler().handleRequest(exchange);
        }
    }

    private synchronized boolean isValid(String hostName, final NameVirtualHostHandler nameVirtualHostHandler) {
        final String virtualhostNodeKey = VIRTUALHOSTS_KEY + "/" + hostName;
        return data.exist(virtualhostNodeKey) && !nameVirtualHostHandler.getHosts().containsKey(virtualhostNodeKey);
    }
}
