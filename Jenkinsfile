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

        stage('Login') {
            steps{
                withDockerRegistry(credentialsId: 'docker-hub', url: 'currently https://index.docker.io/v1/'){
                    sh 'sudo docker push rinloda/sprits-club:latest'
                }
            }
        }
    }
}

