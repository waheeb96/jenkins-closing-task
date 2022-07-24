# build using maven

FROM maven as build
WORKDIR /code
RUN  mvn clean package


# run 

FROM openjdk:17.0.2-oraclelinux8 
WORKDIR /app
COPY --from=build code/target/jenkins-closing-task-0.0.1-SNAPSHOT.jar .

EXPOSE 5000

CMD ["java","-jar", "app/jenkins-closing-task-0.0.1-SNAPSHOT.jar"]
