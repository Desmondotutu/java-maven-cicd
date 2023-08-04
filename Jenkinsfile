pipeline {
    agent any
    environment {
        mvn = tool 'maven3'
        SCANNER_HOME = tool 'SonarQubeScanner5.0'
    }

    stages {
        stage('SCM') {
            steps {
                checkout scm
            }
        }

        stage('Compile') {
            steps {
                sh "${mvn}/bin/mvn clean compile"
            }
        }

       /* stage('Test') {
            steps {
                sh "${mvn}/bin/mvn test"
            }
        } */

        stage('SonarQube Analysis') {
            steps {
              withSonarQubeEnv(credentialsId: 'sonar-secret', installationName: 'SonarqubeServer10') {
              sh "${SCANNER_HOME}/bin/sonar:sonar -Dsonar.projectKey=java"
                }
            }
        }

        stage('Package') {
            steps {
                sh "${mvn}/bin/mvn install"
            }
        }
    }
}
