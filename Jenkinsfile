
pipeline {
    agent any

    environment {
        IMAGE_NAME = "divakar2141/hotelr-app"
        TAG = "latest"
        GIT_REPO = "https://github.com/Divakarg63/HotelR.git"
        GIT_BRANCH = "main"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: "${GIT_BRANCH}",
                    url: "${GIT_REPO}",
                    credentialsId: "Divaa"
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-cred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                docker rm -f hotelr-container || true
                docker run -d -p 3003:80 --name hotelr-container $IMAGE_NAME:$TAG
                '''
            }
        }
    }
}
