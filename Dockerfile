FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
COPY --from=builder /app/target/dependency/ ./dependency/
ENTRYPOINT ["java", "-cp", "app.jar:dependency/*", "com.github.shy526.App"]
