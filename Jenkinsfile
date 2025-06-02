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
                // Replace with your Jenkins Docker Hub credentials ID
                DOCKERHUB_CREDENTIALS = credentials('github-id')
            }
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKERHUB_CREDENTIALS') {
                        docker.image("${IMAGE_NAME}:${env.BUILD_NUMBER}").push()
                        docker.image("${IMAGE_NAME}:${env.BUILD_NUMBER}").tag('latest')
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }
    }
}

