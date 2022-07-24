# build using maven

FROM openjdk:17.0.2-oraclelinux8  as build

COPY /news-parser /news-parser

RUN cd /news-parser \
    && ./mvn clean package



# run 

FROM openjdk:17.0.2-oraclelinux8 

COPY --from=build Ynet-News/build/libs/Ynet-News-0.0.1-SNAPSHOT.jar .

EXPOSE 5000

CMD ["java","-jar", "Ynet-News-0.0.1-SNAPSHOT.jar"]
