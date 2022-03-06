pipeline{

	agent {label 'linux'}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-hub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/rinloda/sprits-club.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t rinloda/sprits-club:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push rinloda/sprits-club:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}