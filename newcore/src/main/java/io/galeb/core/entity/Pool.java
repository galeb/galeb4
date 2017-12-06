package io.galeb.core.entity;

import java.util.Map;
import java.util.Set;

public class Pool extends AbstractEntity implements WithStatus {

    private Set<Rule> rules;
    private Set<Environment> environments;
    private Set<Target> targets;
    private Project project;
    private BalancePolicy balancePolicy;
    private String name;

    // Healthcheck Attributes
    private String hcPath;
    private String hcHttpStatusCode;
    private String hcHost;
    private Boolean hcTcpOnly;
    private HealthCheck.HttpMethod hcHttpMethod;
    private String hcBody;
    private Map<String, String> hcHeaders;

    public Set<Rule> getRules() {
        return rules;
    }

    public void setRules(Set<Rule> rules) {
        this.rules = rules;
    }

    public Set<Environment> getEnvironments() {
        return environments;
    }

    public void setEnvironments(Set<Environment> environments) {
        this.environments = environments;
    }

    public Set<Target> getTargets() {
        return targets;
    }

    public void setTargets(Set<Target> targets) {
        this.targets = targets;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public BalancePolicy getBalancePolicy() {
        return balancePolicy;
    }

    public void setBalancePolicy(BalancePolicy balancePolicy) {
        this.balancePolicy = balancePolicy;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHcPath() {
        return hcPath;
    }

    public void setHcPath(String hcPath) {
        this.hcPath = hcPath;
    }

    public String getHcHttpStatusCode() {
        return hcHttpStatusCode;
    }

    public void setHcHttpStatusCode(String hcHttpStatusCode) {
        this.hcHttpStatusCode = hcHttpStatusCode;
    }

    public String getHcHost() {
        return hcHost;
    }

    public void setHcHost(String hcHost) {
        this.hcHost = hcHost;
    }

    public Boolean getHcTcpOnly() {
        return hcTcpOnly;
    }

    public void setHcTcpOnly(Boolean hcTcpOnly) {
        this.hcTcpOnly = hcTcpOnly;
    }

    public HealthCheck.HttpMethod getHcHttpMethod() {
        return hcHttpMethod;
    }

    public void setHcHttpMethod(HealthCheck.HttpMethod hcHttpMethod) {
        this.hcHttpMethod = hcHttpMethod;
    }

    public String getHcBody() {
        return hcBody;
    }

    public void setHcBody(String hcBody) {
        this.hcBody = hcBody;
    }

    public Map<String, String> getHcHeaders() {
        return hcHeaders;
    }

    public void setHcHeaders(Map<String, String> hcHeaders) {
        this.hcHeaders = hcHeaders;
    }
}