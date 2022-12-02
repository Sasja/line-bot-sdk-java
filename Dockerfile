FROM openjdk:8-jdk-alpine as intermediate
COPY . app/
WORKDIR app/sample-spring-boot-echo
RUN ../gradlew build

FROM openjdk:8-jdk-alpine
COPY --from=intermediate /app/sample-spring-boot-echo/build/libs/sample-spring-boot-echo-5.1.0-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
