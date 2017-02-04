FROM java:8-jdk

ENV JAVA_HOME              /usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_OPTS              ""
ENV PATH                   $PATH:$JAVA_HOME/bin

ENV TIME_ZONE              Europe/Paris
ENV SPRING_PROFILES_ACTIVE test

RUN echo "$TIME_ZONE" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

WORKDIR /app

EXPOSE 8080

ADD account-api-0.0.1-SNAPSHOT.jar /app/account-api.jar

CMD ["/bin/sh", "-c", "java $JAVA_OPTS -jar /app/account-api.jar --spring.profiles.active=$SPRING_PROFILES_ACTIVE"]
