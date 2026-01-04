FROM gradle:8.14.3-jdk17 AS build

# 작업 디렉토리
WORKDIR /app

# 의존성 캐시 최적화
COPY build.gradle settings.gradle ./
COPY gradle ./gradle

# BuildKit 캐시를 활용한 의존성 다운로드
# RUN 명령어는 그대로 두고, 캐시는 build 명령어에서 적용
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
