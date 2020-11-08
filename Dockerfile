FROM jboss/wildfly

COPY standalone-full.xml /opt/jboss/wildfly/standalone/configuration/
COPY postgresql-42.2.0.jar /opt/jboss/wildfly/standalone/deployments/

RUN /opt/jboss/wildfly/bin/add-user.sh -a -u root -p root -g guest --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-c", "standalone-full.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

ADD logiweb/target/logiweb.war /opt/jboss/wildfly/standalone/deployments/
ADD logiwebDisplay/target/logiwebDisplay.war /opt/jboss/wildfly/standalone/deployments/
