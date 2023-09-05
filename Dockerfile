FROM adoptopenjdk/openjdk11 AS builder

ENV DATABASE_URL e
ENV DATABASE_USERNAME e
ENV DATABASE_PASSWORD e


COPY shopping-mall-spring-boot/gradlew .
COPY shopping-mall-spring-boot/gradle gradle
COPY shopping-mall-spring-boot/build.gradle .
COPY shopping-mall-spring-boot/settings.gradle .
COPY shopping-mall-spring-boot/src src
RUN chmod +x ./gradlew
RUN ./gradlew clean bootJar

FROM adoptopenjdk/openjdk11
COPY --from=builder build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", \
    "-Dspring.datasource.url=${DATABASE_URL}", \
    "-Dspring.datasource.DATABASE_USERNAME=${DATABASE_USERNAME}", \
    "-Dspring.datasource.DATABASE_PASSWORD=${DATABASE_PASSWORD}", \
    "/app.jar"]
