pipeline {
    agent any

    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
        }

        stage('BuildAndPush') { 
            steps { 
                script{
                  sh 'make docker-build-and-push' 
                }
            }
        }
        stage('Deploy'){
            steps {
                 sh 'kubectl apply -f deployment.yml'
            }
        }

    }
}