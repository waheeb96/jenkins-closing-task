# build using maven

FROM openjdk:17.0.2-oraclelinux8  as build

COPY /news-parser /news-parser

RUN cd /news-parser \
    && ./mvn clean package



# run 

FROM openjdk:17.0.2-oraclelinux8 

COPY --from=build news-parser/target/jenkins-closing-task-0.0.1-SNAPSHOT.jar .

EXPOSE 5000

CMD ["java","-jar", "jenkins-closing-task-0.0.1-SNAPSHOT.jar"]
