pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'eaafe8c4-a887-4c55-b383-78d37182e7ce'// Jenkins Credential ID for Docker
        // SONARQUBE_CREDENTIALS = credentials('')  // Sonarqube Credentials
        GITHUB_REPO = "https://github.com/Arisetty5/Wikipedia-Search-Web-Application.git" //Github credentials
        // TR_DIR = 'Terrform-files' // Directory containing terraform scripts
        DOCKER_IMAGE_NAME = 'arisetty5/wikipedia-search-app' //Docker image name
        
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

                // Build a docker image
                sh "docker build -t ${DOCKER_IMAGE_NAME}:${env.BUILD_ID} ."

                }
            }
            
        }
        stage('Push the image to Docker Hub') {
            steps {
                script {
                // Login to Docker Hub
                withCredentials([usernamePassword(credentialsID: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                }

                // Push the newly created image to Docker hub
                sh "docker push ${DOCKER_IMAGE_NAME}:${env.BUILD_ID}"
                }
            }  
            
        }

    }
    post {
        always {
            // Cleanup workspace
            cleanws()
        }
    }
}
