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
			  sh 'docker build . -t briandwamba/cv-arlette '
			}
		}
	        stage('Docker-Hub-Login') {
	            steps {
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'   
	            }
	        }
	        stage("Push"){
	            steps {
	                sh 'docker push briandwamba/cv-arlette'
	            }
	        }
	}	

	post {
		success {
			agent { label : 'gabriella' }
			steps {
				sh 'docker stop cv-arlette'
				sh 'docker run --rm --name cv-arlette -p 80:80 briandwamba/cv-arlette'
			}
		}
	}

}
