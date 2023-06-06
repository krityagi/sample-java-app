FROM maven AS build
ARG JAR_FILE
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package -DskipTests
RUN mv target/${JAR_FILE} app.jar

FROM openjdk
WORKDIR /app
COPY --from=build /app/app.jar .
CMD ["java", "-jar", "app.jar"]
