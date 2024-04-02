FROM openjdk:17-jdk-slim

ADD target/simple_maven_sonar-0.0.1-SNAPSHOT.jar simple_maven_sonar-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","simple_maven_sonar-0.0.1-SNAPSHOT.jar"]