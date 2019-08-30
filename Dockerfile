FROM java:8-jdk
LABEL maintainer="ntran"

# Glassfish version
ARG VERSION
ENV VERSION ${VERSION:-5.0.1}

ENV JAVA_HOME         /usr/lib/jvm/java-8-openjdk-amd64
ENV GLASSFISH_HOME    /opt/glassfish/${VERSION}
ENV PATH              $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin
#RUN apt-get update
#RUN apt-get install -y curl unzip zip inotify-tools && \
#   rm -rf /var/lib/apt/lists/*
RUN curl --insecure -L -o /tmp/glassfish-${VERSION}.zip http://download.java.net/glassfish/${VERSION}/release/glassfish-${VERSION}.zip && \
        unzip /tmp/glassfish-${VERSION}.zip -d /opt && \
        rm -f /tmp/glassfish-${VERSION}.zip
EXPOSE 8080 4848 8181
VOLUME [ "/opt/glassfish/${VERSION}"]
WORKDIR /opt/glassfish/${VERSION}
# verbose causes the process to remain in the foreground so that docker can track it
CMD asadmin start-domain --verbose