pipeline {
    agent {label 'slave'}

    stages {
        stage('Run tests') {
            steps {
                echo 'Running tests'
                sh """
                python3 -m venv venv
                . venv/bin/activate
                pwd
                """
            }
        }
    }
}
