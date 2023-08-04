FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from stage=build /src/target/desmondo.jar /app
EXPOSE 8082
CMD ["java", "-jar", "desmondo.jar"]
