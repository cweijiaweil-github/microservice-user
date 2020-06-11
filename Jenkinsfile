
pipeline {
    agent any
    stages { 
        stage('Checkout') {
            steps {
                echo 'pull git'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git-account', url: 'https://github.com/cweijiaweil-github/microservice-user.git']]])
            }
        } 
        stage('Build') {
            steps {
                echo 'package'
                bat "mvn -Dmaven.test.failure.ignore clean package" 
            }
        }
        stage('Image') { 
            steps { 
                echo "Build To Docker!" 
                bat 'docker build -t micro-user:v1 .' 
            } 
        }    
        stage('Run') { 
            steps { 
                echo "Run Docker Image" 
                bat 'docker run -d -p 8083:8083 micro-user:v1' 
            } 
        }     
    }
}