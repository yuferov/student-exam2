pipeline {
	agent {label 'agent1'}
	stages {
		stage('Build') {
			steps {
				script {
				def TestImage = docker.build "webapp:1.0"
					TestImage.inside("-u root:wheel") {
					sh """
					pip3 install -e '.[test]'
					"""
					}
				}
			}
		}
	}
}
