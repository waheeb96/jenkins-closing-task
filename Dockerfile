# Build using maven

FROM maven:3.8.6-openjdk-18-slim as build
WORKDIR /code
COPY pom.xml /code/pom.xml
COPY src /code/src
RUN  mvn clean package

# run 

FROM openjdk:17.0.2-oraclelinux8

EXPOSE 8080

CMD ["java","-jar", "--from=build target/jenkins-closing-task-0.0.1-SNAPSHOT.jar"]
