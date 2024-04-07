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
 					 -Dsonar.projectKey=javaexpress-sonar \
 					 -Dsonar.host.url=http://3.70.96.109:9000 \
  					 -Dsonar.login=d2c8fec69fd0f3fdf398986c57732db42aeff861
                '''
            }
        }  
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}
