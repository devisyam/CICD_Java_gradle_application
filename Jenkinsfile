pipeline{
    agent any
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
        stage("build") {
            steps {
                sh "mvn clean package"
            }
        }
        stage("sonarqube analysis") {
            steps {
                withSonarQubeEnv('sonar-auth') {
                    sh "mvn sonar:sonar"
                }
            }
        }
    }
}
