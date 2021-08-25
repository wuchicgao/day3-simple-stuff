FROM docker.io/ibmcom/websphere-liberty:20.0.0.5-full-java11-openj9-ubi
COPY target/simple-stuff.war /config/dropins/
COPY config/server.xml /config/
COPY config/server.env /config/
ENV FOLDER=/my-special-folder
USER root
RUN mkdir -p $FOLDER
RUN chgrp -R 0 $FOLDER \
   && chmod -R g=u $FOLDER
COPY Dockerfile $FOLDER/
