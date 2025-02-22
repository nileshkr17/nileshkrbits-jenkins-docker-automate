pipeline {
    agent any  // Run on any available Jenkins agent
    environment {
       DOCKER_IMAGE = 'nileshkrbits/my-nginx'  // Docker image name
    }
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/nileshkr17/nileshkrbits-jenkins-docker-automate.git'  // Replace with your GitHub repo URL
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:latest .'  // Builds the Docker image
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u nileshkrbits --password-stdin'  // Logs into Docker Hub
                }
            }
        }
        stage('Push Image to Docker Hub') {
            steps {
                sh 'docker push $DOCKER_IMAGE:latest'  // Pushes the image to Docker Hub
            }
        }
    }
}
