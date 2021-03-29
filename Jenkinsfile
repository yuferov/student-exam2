pipeline {
	agent {label 'agent1'}
	stages {
		stage('Build') {
			steps {
				script {
					def TestImage = docker.build 'webapp:1.0'
					TestImage.withRun {c->
						sh "coverage run -m pytest"
					}
				}
			}
		}
	}
}
