pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'nileshkrbits/devops'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/nileshkr17/nileshkrbits-jenkins-docker-automate.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:latest .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u nileshkrbits --password-stdin'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'docker push $DOCKER_IMAGE:latest'
            }
        }
    }
}