SET autocommit=0;
START TRANSACTION;
INSERT INTO rolegroup (created_at, created_by, last_modified_at, last_modified_by, version, quarantine, name) VALUES (NOW(), 'system', NOW(), 'system', 0, false, 'SUPER_ADMIN');
SELECT @A:=id FROM rolegroup WHERE rolegroup.name = 'SUPER_ADMIN';
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ACCOUNT_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ACCOUNT_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ACCOUNT_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ACCOUNT_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ACCOUNT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ACCOUNT_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ACCOUNT_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'BALANCEPOLICY_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'BALANCEPOLICY_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'BALANCEPOLICY_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'BALANCEPOLICY_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'BALANCEPOLICY_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'BALANCEPOLICY_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'BALANCEPOLICY_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ENVIRONMENT_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ENVIRONMENT_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ENVIRONMENT_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ENVIRONMENT_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ENVIRONMENT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ENVIRONMENT_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ENVIRONMENT_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHCHECK_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHCHECK_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHCHECK_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHCHECK_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHCHECK_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHCHECK_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHCHECK_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHSTATUS_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHSTATUS_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHSTATUS_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHSTATUS_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHSTATUS_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHSTATUS_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'HEALTHSTATUS_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'POOL_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'POOL_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'POOL_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'POOL_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'POOL_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'POOL_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'POOL_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'PROJECT_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'PROJECT_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'PROJECT_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'PROJECT_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'PROJECT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'PROJECT_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'PROJECT_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ROLEGROUP_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ROLEGROUP_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ROLEGROUP_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ROLEGROUP_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ROLEGROUP_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ROLEGROUP_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'ROLEGROUP_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULE_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULE_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULE_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULE_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULE_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULE_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULE_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULEORDERED_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULEORDERED_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULEORDERED_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULEORDERED_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULEORDERED_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULEORDERED_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'RULEORDERED_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TARGET_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TARGET_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TARGET_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TARGET_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TARGET_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TARGET_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TARGET_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TEAM_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TEAM_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TEAM_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TEAM_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TEAM_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TEAM_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'TEAM_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOST_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOST_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOST_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOST_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOST_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOST_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOST_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOSTGROUP_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOSTGROUP_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOSTGROUP_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOSTGROUP_DELETE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOSTGROUP_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOSTGROUP_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@A, 'VIRTUALHOSTGROUP_ADMIN');
COMMIT;
START TRANSACTION;
INSERT INTO rolegroup (created_at, created_by, last_modified_at, last_modified_by, version, quarantine, name) VALUES (NOW(), 'system', NOW(), 'system', 0, false, 'LOCAL_ADMIN');
SELECT @B:=id FROM rolegroup WHERE rolegroup.name = 'LOCAL_ADMIN';
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'ACCOUNT_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'ACCOUNT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'BALANCEPOLICY_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'BALANCEPOLICY_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'ENVIRONMENT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'ENVIRONMENT_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'HEALTHCHECK_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'HEALTHCHECK_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'HEALTHSTATUS_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'HEALTHSTATUS_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'POOL_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'POOL_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'POOL_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'POOL_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'POOL_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'PROJECT_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'PROJECT_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'PROJECT_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'PROJECT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'ROLEGROUP_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'RULE_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'RULE_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'RULE_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'RULE_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'RULEORDERED_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'RULEORDERED_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'RULEORDERED_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'RULEORDERED_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'TARGET_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'TARGET_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'TARGET_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'TARGET_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'TEAM_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'TEAM_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'VIRTUALHOST_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'VIRTUALHOST_SAVE_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'VIRTUALHOST_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'VIRTUALHOST_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'VIRTUALHOSTGROUP_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'VIRTUALHOSTGROUP_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'VIRTUALHOSTGROUP_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@B, 'VIRTUALHOSTGROUP_SAVE_ALL');
COMMIT;
START TRANSACTION;
INSERT INTO rolegroup (created_at, created_by, last_modified_at, last_modified_by, version, quarantine, name) VALUES (NOW(), 'system', NOW(), 'system', 0, false, 'USER');
SELECT @C:=id FROM rolegroup WHERE rolegroup.name = 'USER';
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'ACCOUNT_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'ACCOUNT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'BALANCEPOLICY_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'BALANCEPOLICY_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'ENVIRONMENT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'ENVIRONMENT_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'HEALTHCHECK_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'HEALTHCHECK_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'HEALTHSTATUS_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'HEALTHSTATUS_VIEW_ALL');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'POOL_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'POOL_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'POOL_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'POOL_ADMIN');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'PROJECT_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'ROLEGROUP_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'RULE_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'RULE_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'RULE_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'RULEORDERED_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'RULEORDERED_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'RULEORDERED_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'TARGET_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'TARGET_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'TARGET_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'TEAM_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'VIRTUALHOST_SAVE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'VIRTUALHOST_DELETE');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'VIRTUALHOST_VIEW');
INSERT INTO rolegroup_roles (rolegroup_id, role) VALUES (@C, 'VIRTUALHOSTGROUP_VIEW');
COMMIT;
SET autocommit=1;
