pipeline {
    agent any
    environment {
        mvn = tool 'maven3'
    }

    stages {
        stage("Cleanup Workspace"){
            steps {
                cleanWs()
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
              withSonarQubeEnv(installationName: 'SonarqubeServer10') {
              sh "${mvn}/bin/mvn sonar:sonar -Dsonar.token=sonar-secret -Dsonar.projectKey=java"
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
