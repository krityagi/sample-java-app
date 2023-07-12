FROM maven AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM openjdk 
COPY --from=builder /app/target/helloworld-1.0.0-SNAPSHOT.jar /app/helloworld-1.0.0-SNAPSHOT.jar  
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/app/helloworld-1.0.0-SNAPSHOT.jar"]
