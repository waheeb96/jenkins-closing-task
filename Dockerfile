# build using maven

FROM maven as build
RUN git clone https://github.com/waheeb96/jenkins-closing-task \
  && cd jenkins-closing-task \
  && mvn clean package


# run 

FROM openjdk:17.0.2-oraclelinux8 
WORKDIR app
COPY --from=build /target/jenkins-closing-task-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java","-jar", "/app/jenkins-closing-task-0.0.1-SNAPSHOT.jar"]
