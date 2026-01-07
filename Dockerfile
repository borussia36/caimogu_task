FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .                    # 先复制源码
RUN mvn clean package -DskipTests  # 先生成 app.jar

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/app.jar app.jar  # 后复制胖 JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
