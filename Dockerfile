FROM java:8-jdk
LABEL maintainer="ntran"

# Glassfish version
ENV GF_VERSION=5.0

ENV JAVA_HOME         /usr/lib/jvm/java-8-openjdk-amd64
ENV GLASSFISH_HOME    /opt/glassfish5
ENV PATH              $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin
#RUN apt-get update
#RUN apt-get install -y curl unzip zip inotify-tools && \
#   rm -rf /var/lib/apt/lists/*
RUN curl --insecure -L -o /tmp/glassfish-$GF_VERSION.zip http://download.java.net/glassfish/$GF_VERSION/release/glassfish-$GF_VERSION.zip && \
        unzip /tmp/glassfish-$GF_VERSION.zip -d /opt && \
        rm -f /tmp/glassfish-$GF_VERSION.zip
EXPOSE 8080 4848 8181
VOLUME [ "/opt/glassfish5"]
WORKDIR /opt/glassfish5
# verbose causes the process to remain in the foreground so that docker can track it
CMD $GLASSFISH_HOME/bin/asadmin start-domain --verbose