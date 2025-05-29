pipeline {
    agent any
    stages {
        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/apurva1045/devops-deployment-project.git'
            }
        }
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
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
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
