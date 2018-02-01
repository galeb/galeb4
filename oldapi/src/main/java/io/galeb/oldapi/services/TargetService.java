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

package io.galeb.oldapi.services;

import io.galeb.oldapi.entities.v1.Target;
import io.galeb.oldapi.services.components.LinkProcessor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class TargetService extends AbstractConverterService<Target> {

    private static final Logger LOGGER = LogManager.getLogger(TargetService.class);

    private final LinkProcessor linkProcessor;

    @Autowired
    public TargetService(LinkProcessor linkProcessor) {
        super();
        this.linkProcessor = linkProcessor;
    }

    @Override
    void convertFromV2LinksToV1Links(Set<Link> links, Long id) {
        linkProcessor.add(links,"/" + getResourceName() + "/" + id + "/parent", "parent")
                     .add(links,"/" + getResourceName() + "/" + id + "/project", "project")
                     .add(links,"/" + getResourceName() + "/" + id + "/environment", "environment")
                     .remove(links, "pools")
                     .remove(links, "healthStatus");
    }

}
