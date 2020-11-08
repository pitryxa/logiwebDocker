FROM jboss/wildfly

COPY standalone-full.xml /opt/jboss/wildfly/standalone/configuration/
COPY postgresql-42.2.0.jar /opt/jboss/wildfly/standalone/deployments/
#COPY standalone.conf /opt/jboss/wildfly/bin/
#USER root
RUN /opt/jboss/wildfly/bin/add-user.sh -a -u root -p root -g guest --silent
#RUN rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-c", "standalone-full.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

ADD logiweb/target/logiweb.war /opt/jboss/wildfly/standalone/deployments/
ADD logiwebDisplay/target/logiwebDisplay.war /opt/jboss/wildfly/standalone/deployments/