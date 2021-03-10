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
                """
            }
	    steps {
		pip install -e '.[test]'
		coverage run -m pytest
		coverage report
	    }
        }
    }
}
