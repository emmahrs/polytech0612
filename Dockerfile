# Première partie : créer notre jar
FROM maven:3-eclipse-temurin-21-alpine as maven

WORKDIR /app

COPY . .

RUN mvn clean package

# Deuxième partie
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=maven target/backend-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java", "-jar", "backend-0.0.1-SNAPSHOT.jar"]


