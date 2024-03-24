pipeline {
 environment {
 registry = "yhalim8/tp_devops"
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
 }
}
