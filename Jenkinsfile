pipeline {
	agent none
	
	environment {
	        DOCKERHUB_CREDENTIALS = credentials('docker-registry')
	        VBOXUSER_CREDENTIALS = credentials('vboxuser')		
    	}

	stages {
		stage ("Checkout") {
			agent {label 'localhost'}
                  	steps {
			  git branch: 'main', url: 'https://github.com/arlettemakuissu/nav-1.git'
			}
		}
		stage ("Build-Docker-Image") {
			agent {label 'localhost'}
                  	steps {
			  sh 'ls images'
			  sh ' docker rmi briandwamba/cv-arlette || true'
			  sh 'docker build . -t briandwamba/cv-arlette '
			}
		}
	        stage('Docker-Hub-Login') {
			agent {label 'localhost'}
		        steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'   
		        }
	        }
	        stage("Push"){
			agent {label 'localhost'}
	            	steps {
	                	sh 'docker push briandwamba/cv-arlette'
	            	}
	        }
		stage("Deploy"){
			agent {label 'gabriella'}
	            	steps {
	                	sh 'docker stop cv-arlette || true'
				sh ' docker rmi briandwamba/cv-arlette || true'
				sh 'docker run --rm --name cv-arlette -d -p 80:80 briandwamba/cv-arlette'
	            	}
	        }
		
	}	

}
