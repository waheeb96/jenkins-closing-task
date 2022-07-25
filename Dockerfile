# Build using maven

FROM maven:3.8.6-amazoncorretto-8 as build
COPY pom.xml /pom.xml
COPY src /src
WORKDIR /code

RUN  mvn clean package

# run 

FROM openjdk:17.0.2-oraclelinux8

EXPOSE 8080

CMD ["java","-jar", "--from=build target/jenkins-closing-task-0.0.1-SNAPSHOT.jar"]
