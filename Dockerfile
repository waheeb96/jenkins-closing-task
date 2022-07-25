# Build using maven

FROM openjdk:17.0.2-oraclelinux8  as build

RUN ./mvn clean package
   
# run 

FROM openjdk:17.0.2-oraclelinux8

EXPOSE 8080

CMD ["java","-jar", "--from=build ./target/jenkins-closing-task-0.0.1-SNAPSHOT.jar"]
