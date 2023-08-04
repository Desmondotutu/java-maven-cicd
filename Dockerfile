FROM maven as build
WORKDIR /src
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /src
COPY --from stage build /src/target/*.jar /src
EXPOSE 8082
CMD ("java", "-jar", )
