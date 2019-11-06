FROM maven:3.5-jdk-8 AS build
COPY src /usr/questionService/src
COPY pom.xml /usr/questionService
RUN mvn -f /usr/questionService/pom.xml clean package
EXPOSE 8080
ENTRYPOINT ["java","-Dspring.data.mongodb.uri=mongodb://mymongodb:27017/glarimy","-jar","/usr/questionService/target/quiz-question-service-1.0.0.jar"]