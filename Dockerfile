# Use an official JDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy pom.xml and install dependencies separately for caching
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the project files and build the application
COPY . .
RUN mvn clean package

# Run the application
CMD ["java", "-jar", "target/*.jar"]
