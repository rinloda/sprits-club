pipeline{
    agent any
    stages (Cloning stages) {
        steps {
            git credentialsId: 'github_id', url: 'https://github.com/rinloda/sprits-club.git' 
        }
    }
    stages (Docker stages){
        steps {
            // This step should not normally be used in your script. Consult the inline help for details.
            withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
                sh 'docker build -t rinloda/sprit-club:v1 .'
                sh 'docker push rinloda/sprit-club:v1'
            }
        }
    }
}