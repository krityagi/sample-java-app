FROM maven AS build
WORKDIR /app
COPY . /app
RUN mvn clean package
FROM openjdk 
COPY --from=build app/target/helloworld-1.0.0-SNAPSHOT.jar app/helloworld-1.0.0-SNAPSHOT.jar  
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/app/helloworld-1.0.0-SNAPSHOT.jar"] 
