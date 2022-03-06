pipeline {
    agent any
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
    }
}

