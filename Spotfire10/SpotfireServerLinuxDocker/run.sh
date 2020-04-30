/opt/tibco/tss/$SPOTFIRE_VERSION/tomcat/spotfire-bin/config.sh bootstrap --no-prompt --driver-class=$DB_DRIVER --database-url=$DB_URL --username=$DB_USER --password=$DB_PASSWORD --tool-password=$CONFIG_TOOL_PASSWORD --server-alias=$SERVER_FULL -A$IPADDR -A$SERVER_FULL
cat /opt/tibco/tss/$SPOTFIRE_VERSION/tomcat/webapps/spotfire/WEB-INF/bootstrap.xml
/opt/tibco/tss/$SPOTFIRE_VERSION/tomcat/bin/catalina.sh run
