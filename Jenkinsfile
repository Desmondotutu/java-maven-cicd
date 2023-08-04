node {
  def mvn = tool 'maven3';
  def SCANNER_HOME = tool 'SonarQubeScanner5.0';
  stage('SCM') {
    checkout scm
  }
    stage('Compile') {
      sh "${mvn}/bin/mvn clean compile"
  }
    stage('Test') {
      sh "${mvn}/bin/mvn test"
  }
    stage('SonarQube Analysis') {
      withSonarQubeEnv('SonarqubeServer10') {
      sh "${SCANNER_HOME}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=java"
    }
  }
    stage('Package') {
      sh "${mvn}/bin/mvn install"
  }
}
