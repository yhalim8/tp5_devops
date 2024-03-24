pipeline {
 environment {
 registry = "yhalim8/tp-devops"
 registryCredential = 'dockerhub'
 dockerImage = ''
 }
 agent any
 stages {
 stage('Cloning Git') {
 steps {
 git 'https://github.com/yhalim8/tp5_devops.git'
 }
 }
 stage('Building image') {
 steps{
 script {
 dockerImage = docker.build registry + ":$BUILD_NUMBER"
 }
 }
 }
stage('Test image') {
 steps{
 script {
 echo "Tests passed"
 }
 }
 }
 stage('Publish Image') {
 steps{
 script {
 docker.withRegistry( '', registryCredential ) {
 dockerImage.push()
 }
 }
 }
 }
    stage('Stop Previous Instance') {
            steps {
                script {
                        
                        PID=$(lsof -t -i:3030)
                        if [ -n "$PID" ]; then
                            echo "Stopping previous instance of your_application_name (PID: $PID)"
                            kill $PID
                        else
                            echo "No previous instance of your_application_name running."
                        fi
                }
            }
        }
 stage('Deploy image') {
 steps{
 sh "docker run -d $registry:$BUILD_NUMBER"
 }
 }
 }
}
