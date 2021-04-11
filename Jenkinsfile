pipeline {
	agent {label 'jenkins-slave1'}
	stages {
		stage('Build') {
			steps {
				script {
					def TestImage = docker.build 'webapp:1.0'
					stage('test')
					TestImage.inside ("--entrypoint=''") {
					sh """
					pip3 install -e '.[test]'
					coverage run -m pytest
					coverage report
					"""
					}	
				}	
			}
		}
	}
}
