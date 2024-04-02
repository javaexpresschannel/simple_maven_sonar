pipeline {
    agent any 
   tools {
        maven "MAVEN"
     
    }
    stages {
		stage('Checkout') { 
            steps {
                git 'https://github.com/javaexpresschannel/simple_maven_sonar.git'
            }
        }

        stage('Compile') { 
            steps {
                sh "mvn clean compile"
            }
        }
        stage('Build') { 
            
            steps {
                sh "mvn package"
            }
        }        
        stage('Sonar') { 
            
            steps {
                sh "mvn package"
            }
        }  
        stage('Docker Login'){
            
            steps {
                  withCredentials([string(credentialsId: 'DockerId', variable: 'Dockerpwd')]) {
                    sh "docker login -u javaexpress -p ${Dockerpwd}"
                }
                             
        }
        stage('Docker Push'){
            steps {
                sh 'docker push javaexpress/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}