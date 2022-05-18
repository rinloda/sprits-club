pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-hub')
        DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${GIT_COMMIT.substring(0,7)}"
        DOCKER_REGISTRY="192.168.4.100:8080"
        DOCKER_IMAGE="sprits-club"
        DOCKER_REPO="rinloda"
	}
    stages {
        // stage('Clone stages') {
        //     steps {
        //         git credentialsId: 'github_id', url: 'https://github.com/rinloda/sprits-club.git'
        //     }
        // }
    
        stage('Docker build'){
            steps {
                sh 'sudo docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                sh 'sudo docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_REPO}/${DOCKER_IMAGE}:${DOCKER_TAG}'
                sh 'sudo docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_REPO}/${DOCKER_IMAGE}:latest'
            }
        }

        stage('Login') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                
            }
        }

        stage('Docker push'){
            steps{
                sh 'sudo docker push ${DOCKER_REPO}/${DOCKER_IMAGE}:${DOCKER_TAG}'
                sh 'sudo docker push ${DOCKER_REPO}/${DOCKER_IMAGE}:latest'
                sh "sudo docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}" //Remove to save storage
            }
        }
    }
}