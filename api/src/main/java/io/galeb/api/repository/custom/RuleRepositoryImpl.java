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

package io.galeb.api.repository.custom;

import io.galeb.api.repository.EnvironmentRepository;
import io.galeb.api.services.StatusService;
import io.galeb.core.entity.AbstractEntity;
import io.galeb.core.entity.Environment;
import io.galeb.core.entity.Rule;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Set;

@SuppressWarnings({"unused", "SpringJavaAutowiredMembersInspection"})
public class RuleRepositoryImpl extends AbstractRepositoryImplementation<Rule> implements RuleRepositoryCustom, WithRoles {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private StatusService statusService;

    @Autowired
    private EnvironmentRepository environmentRepository;

    @PostConstruct
    private void init() {
        setSimpleJpaRepository(Rule.class, em);
        setStatusService(statusService);
    }

    @Override
    protected Set<Environment> getAllEnvironments(AbstractEntity entity) {
        return environmentRepository.findAllByRuleId(entity.getId());
    }

    @Override
    protected long getProjectId(Object criteria) {
        Rule rule = null;
        try {
            if (criteria instanceof Rule) {
                rule = em.find(Rule.class, ((Rule) criteria).getId());
            }
            if (criteria instanceof Long) {
                rule = em.find(Rule.class, criteria);
            }
            if (criteria instanceof String) {
                String query = "SELECT r FROM Rule r WHERE r.name = :name";
                rule = em.createQuery(query, Rule.class).setParameter("name", criteria).getSingleResult();
            }
        } catch (Exception ignored) {}
        return rule != null ? rule.getProject().getId() : -1L;
    }
}
