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
        stage('sonar') { 
            
            steps {
                sh '''
               mvn sonar:sonar \
                  -Dsonar.projectKey=test2 \
                  -Dsonar.host.url=http://13.60.61.9:9000 \
                  -Dsonar.login=fb1408bb389c6d0ef1321e6f6e810a5daa58c57b
                '''
            }
        }  
        stage('Docker Login'){
            
            steps {
                  withCredentials([string(credentialsId: 'DockerId', variable: 'Dockerpwd')]) 
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
