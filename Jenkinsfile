pipeline {
    agent any
    environment {
        mvn = tool 'maven3'
    }

    stages {
        stage('Code Compile') {
            steps {
                sh "${mvn}/bin/mvn clean compile"
            }
        }

       /* stage('Code Unit Test') {
            steps {
                sh "${mvn}/bin/mvn test"
            }
        } */

        stage('SonarQube Static Code Analysis') {
            steps {
              withSonarQubeEnv(installationName: 'SonarqubeServer10') {
              sh "${mvn}/bin/mvn sonar:sonar -Dsonar.token=sonar-secret -Dsonar.projectKey=java"
                }
            }
        }

        stage('Code Package') {
            steps {
                sh "${mvn}/bin/mvn install"
            }
        }
    }
}
