package io.galeb.api.handler;

import io.galeb.api.services.ChangesService;
import io.galeb.core.entity.AbstractEntity;
import io.galeb.core.entity.Environment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.rest.core.event.AbstractRepositoryEventListener;

import java.util.Collections;
import java.util.Set;

@SuppressWarnings("unused")
public abstract class AbstractHandler<T extends AbstractEntity> extends AbstractRepositoryEventListener<T> {

    @Autowired
    ChangesService changesService;

    @Override
    protected void onBeforeCreate(T entity) {
        super.onBeforeCreate(entity);
    }

    @Override
    protected void onAfterCreate(T entity) {
        super.onAfterCreate(entity);
        registerChanges(entity);
    }

    @Override
    protected void onBeforeSave(T entity) {
        super.onBeforeSave(entity);
    }

    @Override
    protected void onAfterSave(T entity) {
        super.onAfterSave(entity);
        registerChanges(entity);
    }

    @Override
    protected void onBeforeLinkSave(T parent, Object linked) {
        super.onBeforeLinkSave(parent, linked);
    }

    @Override
    protected void onAfterLinkSave(T parent, Object linked) {
        super.onAfterLinkSave(parent, linked);
    }

    @Override
    protected void onBeforeLinkDelete(T parent, Object linked) {
        super.onBeforeLinkDelete(parent, linked);
    }

    @Override
    protected void onAfterLinkDelete(T parent, Object linked) {
        super.onAfterLinkDelete(parent, linked);
    }

    @Override
    protected void onBeforeDelete(T entity) {
        super.onBeforeDelete(entity);
    }

    @Override
    protected void onAfterDelete(T entity) {
        super.onAfterDelete(entity);
    }

    protected Set<Environment> getAllEnvironments(T entity) {
        return Collections.emptySet();
    }

    private void registerChanges(T entity) {
        getAllEnvironments(entity).stream().forEach(e-> changesService.register(e, entity));
    }

}