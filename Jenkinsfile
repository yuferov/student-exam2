pipeline {
	agent {label 'jenkins-slave1'}
	stages {
		stage('Build') {
			steps {
				script {
					def TestImage = docker.build 'webapp:1.0'
					stage('test')
					TestImage.inside (" -u 0:0 --entrypoint=''") {
					sh """
					pip3 install -e -e '.[test]'
					coverage run -m pytest
					coverage report
					"""
					}	
				}	
			}
		}
	}
}
