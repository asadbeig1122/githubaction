pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "docker.io"
        DOCKER_IMAGE = "yourusername/yourimagename"
        DOCKER_TAG = "latest"
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build "${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
        
        stage('Push') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_CREDENTIAL_ID}") {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    sh "kubectl apply -f your_deployment_manifest.yaml"
                }
            }
        }
    }
}
