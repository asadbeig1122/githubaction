pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('asadsadaqat11')
    }
    stages {
        stage('SCM Checkout') {
            steps {
                git 'https://github.com/asadbeig1122/githubaction.git'
            }
        }
        stage('Build docker image') {
            steps {
                sh 'docker build -t asadsadaqat11/test:$BUILD_NUMBER .'
            }
        }
        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push image') {
            steps {
                sh 'docker push asadsadaqat11/test:$BUILD_NUMBER'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
