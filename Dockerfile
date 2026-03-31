FROM openjdk:17-jdk-slim
COPY target/devops-project.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
