pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    stages {
        stage('Clone stages') {
            steps {
                git credentialsId: 'github_id', url: 'https://github.com/rinloda/sprits-club.git'
            }
        }
    
        stage('build'){
            steps {
                sh 'sudo docker build -t rinloda/sprits-club:latest .'
            }
        }

        stage('Login') {
            steps{
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                
            }
        }
    }
}

