pipeline {
	agent {label 'agent1'}
	stages {
		stage('Build') {
			steps {
				script {
					System.setProperty("org.jenkinsci.plugins.durabletask.BourneShellScript.HEARTBEAT_CHECK_INTERVAL", "3800");
 				}
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
