pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/devops-practice-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("devops-practice-app:${env.BUILD_NUMBER}")
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
                DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DOCKERHUB_CREDENTIALS') {
                        docker.image("devops-practice-app:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
