# Build using maven

FROM maven:3.8.6-openjdk-18-slim as build
WORKDIR /code
COPY * /code
RUN  mvn clean package

# run 

FROM openjdk:17.0.2-oraclelinux8
WORKDIR /app
COPY --from=build /code/target/jenkins-closing-task-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080

CMD ["java","-jar", "/app/jenkins-closing-task-0.0.1-SNAPSHOT.jar"]
