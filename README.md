# Wikipedia Search Application Deployment

## Overview

This project involves the development and deployment of a Wikipedia Search Application. The application allows users to search for articles from Wikipedia, providing a simple and intuitive interface.

## Project Workflow

1. **Application Development**:
   - The application was developed using Java, HTML, CSS
   - It allows users to search for Wikipedia articles and displays results in a user-friendly manner.

2. **Containerization**:
   - The application was containerized using Docker, enabling easy deployment and management.
   - A Docker image was created and pushed to Docker Hub for easy access during deployment.

3. **Deployment to Kubernetes**:
   - The application was deployed on a Kubernetes cluster to take advantage of its orchestration capabilities.
   - A Deployment configuration was created to manage application replicas and ensure high availability.
   - A Service was defined to expose the application, allowing it to be accessed via a NodePort.

## Key Steps Taken

- Built and tested the application locally.
- Containerized the application and created a Docker image.
- Deployed the application to a Kubernetes cluster using Deployment and Service YAML configurations.
- Exposed the application via a NodePort for external access.

## Accessing the Application

Once deployed, the application can be accessed through the assigned NodePort. We ensure that appropriate network configurations are in place to allow traffic to the application.

# CI/CD Pipeline

This project includes a CI/CD pipeline implemented using Jenkins to automate the build, test, and deployment processes. Below are the key features of the pipeline:

### Pipeline Stages
1. **Build the Application**: 
   - Uses Maven to compile the code and package it into a JAR file.

2. **Build Docker Image**: 
   - Creates a Docker image from the compiled application.

3. **Push the Image to Docker Hub**: 
   - Logs into Docker Hub and pushes the newly created Docker image to the repository.

### Jenkins Configuration
- **Jenkins Credentials**: 
   - Docker Hub credentials are stored in Jenkins for secure access during the pipeline execution. The credentials ID used in the pipeline is `dockerhub-credentials`.

### Environment Variables
- `DOCKER_CREDENTIALS_ID`: Jenkins Credential ID for Docker.
- `GITHUB_REPO`: GitHub repository URL for the application.
- `DOCKER_IMAGE_NAME`: Name of the Docker image to be created.

### Running the Pipeline
- The pipeline is triggered automatically upon committing changes to the main branch of the GitHub repository. It can also be triggered manually through the Jenkins dashboard.
