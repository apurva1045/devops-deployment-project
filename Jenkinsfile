pipeline {
    agent any

    stages {
        HEAD
        stage('Clone Code') {
            steps {
                git 'https://github.com/apurva1045/devops-deployment-project.git'
            }
        }

        feature-ui
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myflaskapp .'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'No tests yet. Add here later.'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                    docker login -u $DOCKER_USER -p $DOCKER_PASS
                    docker tag myflaskapp $DOCKER_USER/myflaskapp:latest
                    docker push $DOCKER_USER/myflaskapp:latest
                    """
                }
            }
        }
    }
}
