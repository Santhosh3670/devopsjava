pipeline {
    agent any

    environment {
        IMAGE_NAME = 'devops-practice-app'
        DOCKERHUB_CREDENTIALS = credentials('DOCKERHUB_CREDENTIALS') // your Jenkins Docker Hub credential ID
        DOCKERHUB_USERNAME = 'santhosh3016' // your Docker Hub username
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
            steps {
                script {
                    // Tag image with your Docker Hub repo format
                    sh "docker tag ${IMAGE_NAME}:${env.BUILD_NUMBER} ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    sh "docker tag ${IMAGE_NAME}:${env.BUILD_NUMBER} ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:latest"

                    // Push both tags
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKERHUB_CREDENTIALS') {
                        docker.image("${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${env.BUILD_NUMBER}").push()
                        docker.image("${DOCKERHUB_USERNAME}/${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }
    }
}

