pipeline {
	agent {label 'agent1'}
	stages {
		stage('Build') {
			agent {
				dockerfile {
					filename 'Dockerfile'
				}
			}
			steps {
				sh "pwd"
			}
		}
	}
}
