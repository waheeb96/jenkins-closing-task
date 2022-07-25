# Build using maven

FROM openjdk:17.0.2-oraclelinux8  as build

COPY /jenkins-closing-task /ynet-parser

RUN cd /ynet-parser \
    && mvn clean package 



# run 

FROM openjdk:17.0.2-oraclelinux8


COPY --from=build ynet-parser/target/jenkins-closing-task-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java","-jar", "jenkins-closing-task-0.0.1-SNAPSHOT.jar"]
