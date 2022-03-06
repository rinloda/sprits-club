pipeline {
    agent any
    tools {dockerTool  "docker" } 
    stages {
        stage('Clone stages') {
            steps {
                git credentialsId: 'github_id', url: 'https://github.com/rinloda/sprits-club.git'
            }
        }
    
        stage('Hello') {
            steps {
                // This step should not normally be used in your script. Consult the inline help for details.
                withDockerRegistry([credentialsId: 'docker-hub', url: '']) {
                    // some block
                    sh 'docker build -t rinloda/sprits-club:v1.1'
                    sh 'docker push rinloda/sprits-club:v1.1'
                }
            }
        }
    }
}

