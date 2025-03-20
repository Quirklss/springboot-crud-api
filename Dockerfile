# Use official Maven image to build the project
FROM maven:3.8.8-eclipse-temurin-17 AS build

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Build the project and create the JAR file
RUN mvn clean package -DskipTests

# Use a smaller JDK image for running the app
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the Maven build stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "app.jar" ]