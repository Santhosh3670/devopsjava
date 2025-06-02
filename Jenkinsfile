pipeline {
    agent any

    environment {
        IMAGE_NAME = 'devops-practice-app'
    }

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Push Image to Docker Hub') {
            environment {
                DOCKERHUB_CREDENTIALS = credentials('DOCKERHUB_CREDENTIALS')
            }
            steps {
                script {
                    // Use full Docker Hub repo path including your username
                    def imageName = "santhosh3670/devops-practice-app"

                    // Tag the local image with your Docker Hub name
                    docker.image("${IMAGE_NAME}:${env.BUILD_NUMBER}").tag("${imageName}:${env.BUILD_NUMBER}")
                    docker.image("${IMAGE_NAME}:${env.BUILD_NUMBER}").tag("${imageName}:latest")

                    // Login and push using correct image name
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        docker.image("${imageName}:${env.BUILD_NUMBER}").push()
                        docker.image("${imageName}:latest").push()
                    }
                }
            }
        }
    }
}

