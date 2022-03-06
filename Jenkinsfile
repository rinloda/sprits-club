pipeline {
    agent any
    stages {
        stage('Clone stages') {
            steps {
                git credentialsId: 'github_id', url: 'https://github.com/rinloda/sprits-club.git'
            }
        }
    
        stage('Docker') {
            steps {
                
                withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/')  {
                    sh 'docker build -t rinloda/sprits-club:v1.1 .'
                    sh 'docker push rinloda/sprits-club:v1.1'
                }
            }
        }
    }
}

