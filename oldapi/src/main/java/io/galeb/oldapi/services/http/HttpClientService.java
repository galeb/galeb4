/*
 * Copyright (c) 2014-2018 Globo.com - ATeam
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

package io.galeb.oldapi.services.http;

import io.galeb.core.entity.Account;
import io.galeb.oldapi.services.sec.LocalAdminService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.asynchttpclient.AsyncHttpClient;
import org.asynchttpclient.DefaultAsyncHttpClientConfig;
import org.asynchttpclient.Dsl;
import org.asynchttpclient.RequestBuilder;
import org.springframework.http.HttpMethod;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;

import static org.asynchttpclient.Dsl.asyncHttpClient;
import static org.asynchttpclient.Dsl.config;

@Service
public class HttpClientService {

    private static final Logger LOGGER = LogManager.getLogger(HttpClientService.class);

    private static final String USER_AGENT = "OLDAPI/1.0";

    private final DefaultAsyncHttpClientConfig.Builder config = config()
                                                                .setFollowRedirect(true)
                                                                .setSoReuseAddress(true)
                                                                .setKeepAlive(true)
                                                                .setUseInsecureTrustManager(true)
                                                                .setUserAgent(USER_AGENT);
    private final AsyncHttpClient httpClient = asyncHttpClient(config);

    public Response getResponse(String url) throws InterruptedException, ExecutionException {
        Account account = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = account.getUsername();
        String password = account.extractApiTokenFromDetails(LocalAdminService.NAME.equals(username)); // extract token from description
        return getResponse(url, username, password);
    }

    public Response getResponse(String url, String username, String password) throws InterruptedException, ExecutionException {
        RequestBuilder requestBuilder = new RequestBuilder();
        requestBuilder.setRealm(Dsl.basicAuthRealm(username, password).setUsePreemptiveAuth(true));
        requestBuilder.setUrl(url);
        return new AsyncHttpClientResponse(httpClient.executeRequest(requestBuilder).get());
    }

    public Response getResponse(String url, Map<String, String> query) throws ExecutionException, InterruptedException {
        String queryStr = query.entrySet().stream().map(m -> m.getKey() + "=" + m.getValue()).collect(Collectors.joining("&"));
        url = url + (queryStr != null && !queryStr.isEmpty() ? "?" + queryStr : "");
        return getResponse(url);
    }

    private Response doMethod(String url, String body, HttpMethod method) throws ExecutionException, InterruptedException {
        Account account = (Account) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = account.getUsername();
        String password = account.extractApiTokenFromDetails(LocalAdminService.NAME.equals(username)); // extract token from description
        RequestBuilder requestBuilder = new RequestBuilder();
        requestBuilder.setRealm(Dsl.basicAuthRealm(username, password).setUsePreemptiveAuth(true));
        requestBuilder.setUrl(url);
        if (method != HttpMethod.DELETE) requestBuilder.setBody(body);
        requestBuilder.setMethod(method.name());
        return new AsyncHttpClientResponse(httpClient.executeRequest(requestBuilder).get());
    }

    public Response post(String url, String body) throws ExecutionException, InterruptedException {
        return doMethod(url, body, HttpMethod.POST);
    }

    public Response put(String url, String body) throws ExecutionException, InterruptedException {
        return doMethod(url, body, HttpMethod.PUT);
    }

    public Response patch(String url, String body) throws ExecutionException, InterruptedException {
        return doMethod(url, body, HttpMethod.PATCH);
    }

    public Response delete(String url) throws ExecutionException, InterruptedException {
        return doMethod(url, null, HttpMethod.DELETE);
    }

    private static class AsyncHttpClientResponse implements Response {

        private final org.asynchttpclient.Response response;

        private AsyncHttpClientResponse(org.asynchttpclient.Response response) {
            this.response = response;
        }

        @Override
        public boolean hasResponseStatus() {
            return response.hasResponseStatus();
        }

        @Override
        public int getStatusCode() {
            return response.getStatusCode();
        }

        @Override
        public String getResponseBody() {
            return response.getResponseBody();
        }
    }
}
