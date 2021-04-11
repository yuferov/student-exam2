pipeline {
	agent {label 'jenkins-slave1'}
	stages {
		stage('Build') {
			steps {
				script {
					def TestImage = docker.build 'webapp:1.0'
					TestImage.inside ("--entrypoint='/bin/sh -c'") {
					sh """
					pip3 install --user docker -e '.[test]'
					coverage run -m pytest ${pwd}/script.sh
					"""
					}	
				}	
			}
		}
	}
}
