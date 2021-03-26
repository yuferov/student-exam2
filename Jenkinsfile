pipeline {
	agent (label 'agent1') {
		stages {
			steps {
				step {
					dockerfile {
						filename 'Dockerfile'
						reuseNode true
					}
				}
			}
		}
	}
}	
