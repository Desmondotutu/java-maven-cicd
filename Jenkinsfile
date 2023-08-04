node {
  def mvn = tool 'maven3';
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
    withSonarQubeEnv(credentialsId: 'sonar-secret', installationName: 'SonarqubeServer10'){
      sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=java"
    }
  }
    stage('Package') {
      sh "${mvn}/bin/mvn install"
  }
}
