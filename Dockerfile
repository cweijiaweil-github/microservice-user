FROM java:8

VOLUME /tmp

ADD /target/microservice-user-0.0.1-SNAPSHOT.jar microservice-user-0.0.1-SNAPSHOT.jar
RUN bash -c 'touch /microservice-user-0.0.1-SNAPSHOT.jar'

EXPOSE 8083

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/microservice-user-0.0.1-SNAPSHOT.jar"]