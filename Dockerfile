FROM gradle:8.14.3-jdk17 AS build

# 작업 디렉토리
WORKDIR /app

# Gradle 캐시를 독립 볼륨으로 설정
VOLUME /home/gradle/.gradle

# 의존성 캐시 최적화
COPY build.gradle settings.gradle ./
COPY gradle ./gradle
RUN gradle --no-daemon build -x test --refresh-dependencies || true

# 소스 코드 복사
COPY src ./src

# 실제 빌드
RUN gradle --no-daemon bootJar -x test

# -------------------------------
# 2단계: 런타임
# -------------------------------
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# 빌드된 JAR 복사
COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
