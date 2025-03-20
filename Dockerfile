# Use OpenJDK as base image
FROM openjdk:17-jdk-slim

# Set working directory in container
WORKDIR /app

# Copy built JAR file into container
COPY target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
