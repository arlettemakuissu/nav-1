pipeline {
	agent {label 'localhost'}
	
	environment {
	        DOCKERHUB_CREDENTIALS = credentials('docker-registry')
	        VBOXUSER_CREDENTIALS = credentials('vboxuser')		
    	}

	stages {
		stage ("Checkout") {
                  	steps {
			  git branch: 'main', url: 'https://github.com/arlettemakuissu/nav-1.git'
			}
		}
		stage ("Build-Docker-Image") {
                  	steps {
			  sh 'echo $VBOXUSER_CREDENTIALS_PSW | sudo -S docker build . -t cv-arlette '
			}
		}
	        stage('Docker-Hub-Login') {
	            steps {
	                sh 'echo $VBOXUSER_CREDENTIALS_PSW $DOCKERHUB_CREDENTIALS_PSW | sudo -S docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin '   
	            }
	        }
	        stage("Push"){
	            steps {
	                sh 'echo $VBOXUSER_CREDENTIALS_PSW | sudo -S docker push briandwamba/cv-arlette'
	            }
	        }
	}	

}
