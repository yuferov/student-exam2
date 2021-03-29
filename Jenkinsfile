pipeline {
	node ("agent1") {
		agent {
			stages {
				stage('Build') {
					steps {
						script {
							def TestImage = docker.build 'webapp:1.0'
							TestImage.inside {
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
	}
}
