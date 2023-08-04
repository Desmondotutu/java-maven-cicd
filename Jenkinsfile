pipeline {
    agent any
    environment {
        mvn = tool 'maven3'
        SCANNER_HOME = tool 'SonarQubeScanner5.0'
    }

    stages {
        stage('SCM') {
            steps {
                git url: 'https://github.com/Desmondotutu/java-maven-cicd.git'
            }
        }

        stage('Compile') {
            steps {
                sh "${mvn}/bin/mvn clean compile"
            }
        }

        stage('Test') {
            steps {
                sh "${mvn}/bin/mvn test"
            }
        }

        stage('SonarQube Analysis') {
            steps {
              withSonarQubeEnv() {
              sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=java"
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
