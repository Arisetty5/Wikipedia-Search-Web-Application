pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials' // Jenkins Credential ID for Docker
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
                    // Retrieve credentials directly from Jenkins credentials
                    def dockerCreds = Jenkins.instance.getItemByFullName(env.JOB_NAME).getCredentials().find { it.id == DOCKER_CREDENTIALS_ID }
                    
                    if (dockerCreds) {
                        // Login to Docker Hub
                        sh "echo '${dockerCreds.password}' | docker login -u '${dockerCreds.username}' --password-stdin"
                        
                        // Push the newly created image to Docker Hub
                sh "docker push ${DOCKER_IMAGE_NAME}:${env.BUILD_ID}"
                 } else {
                        error("Docker credentials not found")
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
