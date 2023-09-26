pipeline {
    agent any

    environment {
        VERSION = "${env.BUILD_ID}"
    }

    stages {
        stage("SonarQube Analysis") {
            agent {
                docker {
                    image 'openjdk:11'
                }
            }

            environment {
                SCANNER_HOME = tool 'sonar-scanner'
            }

            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonar-auth') {
                        sh "chmod +x gradlew"
                        sh "./gradlew sonar"
                    }
                }
            }
        }
    }
}
