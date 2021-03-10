pipeline {
    agent {label 'slave'}

    stages {
        stage('Run tests') {
            steps {
                echo 'Running tests'
                sh """
                python3 -m venv venv
                . venv/bin/activate
                pip install -e .
		pip install -e '.[test]'
		coverage run -m pytest
		coverage report
                """
	    }
        }
	stage ('build docker images') {
	    agent {
		docker { image 'yuferov/ci-cd-exam:webcalc-v1' }
	    }
	    steps {
		echo 'Build complete'
	    }
	}
    }
}
