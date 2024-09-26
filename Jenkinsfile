pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials' // Jenkins Credential ID for Docker
        GITHUB_REPO = "https://github.com/Arisetty5/Wikipedia-Search-Web-Application.git" // Github repository
        DOCKER_IMAGE_NAME = 'arisetty5/wikipedia-search-app' // Docker image name
    }

    stages {
        stage('Build the application') {
            steps {
                script {
                    // Build the application using Maven
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build a Docker image
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:${env.BUILD_ID} ."
                }
            }
        }

        stage('Push the image to Docker Hub') {
            steps {
                script {
                    // Use withCredentials to manage Docker Hub credentials securely
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Login to Docker Hub
                        sh "echo '${DOCKER_PASSWORD}' | docker login -u '${DOCKER_USERNAME}' --password-stdin"

                        // Push the newly created image to Docker Hub
                        sh "docker push ${DOCKER_IMAGE_NAME}:${env.BUILD_ID}"
                    }
                }
            }
        }
    }

    post {
        always {
            // Cleanup workspace
            cleanWs()
        }
    }
}

