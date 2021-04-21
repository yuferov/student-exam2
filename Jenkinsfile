env.CREDS = 'yuferov-dockerhub'
env.HUB_REPO = 'yuferov/ci-cd-exam'
node ('jenkins-slave1') {
    stage ('Build image') {
        docker.build "$HUB_REPO:$BUILD_TAG"
    }
    stage ('Run tests') {
        docker.image("$HUB_REPO:$BUILD_TAG").inside (" -u 0:0 --entrypoint=''") {
            sh """
	    pip3 install -e '.[test]'
	    coverage run -m pytest
	    coverage report
	    """
        }
    }
    stage ('Push image') {
        docker.withRegistry( '', "$CREDS") {
            docker.image("$HUB_REPO:$BUILD_TAG").push()
            docker.image("$HUB_REPO:$BUILD_TAG").push('latest')
        }
    }
}
