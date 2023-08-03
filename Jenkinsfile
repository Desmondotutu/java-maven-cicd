node {
  stage('SCM') {
    checkout scm
  }
    stage('Compile') {
    def mvn = tool 'DefaultMaven';
      sh "${mvn}/bin/mvn clean compile"
  }
    stage('Test') {
    def mvn = tool 'DefaultMaven';
      sh "${mvn}/bin/mvn test"
  }
  stage('SonarQube Analysis') {
    def mvn = tool 'DefaultMaven';
    withSonarQubeEnv() {
      sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=java"
    }
  }
    stage('Package') {
    def mvn = tool 'DefaultMaven';
      sh "${mvn}/bin/mvn install"
  }
}
