# Dockerfile

# 1. Build Stage
FROM maven:3-eclipse-temurin-17-alpine AS builder
WORKDIR /app

# Maven 의존성 캐싱을 위해 pom.xml을 먼저 복사하여 종속성 오프라인 다운로드 수행
COPY pom.xml .
RUN mvn dependency:go-offline -B

# 소스 코드를 복사하여 패키징 수행 (테스트는 스킵하여 빌드 시간 단축)
COPY src ./src
RUN mvn clean package -DskipTests

# 2. Run Stage (경량 JRE 17 Alpine 기반 멀티 스테이징)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# 빌드 스테이지에서 패키징된 JAR 파일 복사
COPY --from=builder /app/target/*.jar app.jar

# 외부에서 PORT 환경변수를 지정하여 포트를 가변적으로 운영할 수 있도록 지원
# Spring Boot는 OS 환경변수 PORT가 존재하면 내부의 server.port=${PORT:8080} 설정에 우선하여 자동 바인딩합니다.
ENV PORT=8080
EXPOSE ${PORT}

# JVM 실행 최적화 옵션 제공
# -Djava.security.egd=file:/dev/./urandom: 난수 생성 속도 개선을 통해 WAS(Embedded Tomcat) 초기 구동 지연 방지
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
