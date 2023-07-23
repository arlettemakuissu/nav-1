pipeline {
	agent {label 'localhost'}
	
	environment {
	        DOCKERHUB_CREDENTIALS = credentials('docker-registry')
    	}

	stages {
		stage ("Checkout") {
                  	steps {
			  git branch: 'main', url: 'https://github.com/arlettemakuissu/nav-1.git'
			}
		}
		stage ("Build-Docker-Image") {
                  	steps {
			  sh 'echo virus | sudo  docker build . -t cv-arlette -S'
			}
		}
	        stage('Docker-Hub-Login') {
	            steps {
	                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo -u root docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'   
	            }
	        }
	        stage("Push"){
	            steps {
	                sh 'sudo -u root docker push briandwamba/cv-arlette'
	            }
	        }
	}	

}
