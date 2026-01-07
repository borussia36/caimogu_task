FROM maven:3.9.6-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/caimogu-task*.jar app.jar
CMD ["java", "-jar", "app.jar"]
