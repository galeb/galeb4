package io.galeb.api.repository;

import io.galeb.api.security.LocalAdmin;
import io.galeb.core.entity.HealthCheck;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.security.access.prepost.PreAuthorize;

@RepositoryRestResource(path = "healthcheck", collectionResourceRel = "healthcheck", itemResourceRel = "healthcheck")
public interface HealthCheckRepository extends JpaRepository<HealthCheck, Long> {

    @Override
    @PreAuthorize("hasRole('ROLE_ADMIN') or principal.username == '" + LocalAdmin.NAME + "'")
    HealthCheck save(HealthCheck healthCheck);

    @Override
    @PreAuthorize("hasRole('ROLE_ADMIN') or principal.username == '" + LocalAdmin.NAME + "'")
    void delete(Long id);

}
