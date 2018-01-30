## ADMIN ##
export LOCAL_TOKEN=pass

## DB ##
export GALEB_DB_URL='jdbc:mysql://127.0.0.1:3306/galeb_api?autoReconnect=true&createDatabaseIfNotExist=true'
export GALEB_DB_USER=root
export GALEB_DB_PASS=password
export GALEB_DB_DRIVER=com.mysql.cj.jdbc.Driver
export GALEB_DB_DIALECT=org.hibernate.dialect.MySQLDialect
export SHOW_SQL=true
export DDL_MODE=validate

## REDIS ##
export REDIS_URL='redis://127.0.0.1'

## OAUTH ##
export OAUTH_USERINFO=http://127.0.0.1:9000/user/
unset LOGIN_KEY
unset REJECT_KEY

## GALEB_OLDAPI ##
export GALEB_LDAP_URL=ldap://127.0.0.1:3890
export GALEB_LDAP_USER='cn=user1,dc=test'
export GALEB_LDAP_PASS='xxx'
export GALEB_LDAP_BASE='dc=test'
export GALEB_LDAP_DN_ATTRIB=cn
export GALEB_API_URL='http://127.0.0.1:8000'
export SESSION_TIMEOUT=86400 # legacy token auth