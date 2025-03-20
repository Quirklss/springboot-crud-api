# Use an official Java runtime as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper and pom.xml to resolve dependencies
COPY mvnw .
COPY mvnw.cmd .
COPY .mvn .mvn
COPY pom.xml .

# Download project dependencies (without running the application)
RUN ./mvnw dependency:go-offline

# Copy the entire project into the container
COPY src src

# Build the application
RUN ./mvnw package

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/*.jar"]

RUN chmod +x ./mvnw
RUN ./mvnw dependency:go-offline
