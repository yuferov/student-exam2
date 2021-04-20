pipeline {
	environment {
		credentials = 'yuferov-dockerhub'
	}
	agent {label 'jenkins-slave1'}
	stages {
		stage('Build') {
			steps {
				script {
					docker.withRegistry( '', credentials) {
						def TestImage = docker.build 'webapp:1.0'
						stage('Test')
						TestImage.inside (" -u 0:0 --entrypoint=''") {
						sh """
						pip3 install -e '.[test]'
						coverage run -m pytest
						coverage report
						"""
						}
						stage('Push')
						TestImage.push()
					}	
				}	
			}
		}
	}
}
