pipeline {
    agent any

    environment {
        VERSION = "${env.BUILD_ID}"
    }

    stages {
        stage("build") {
              steps {
                  sh "mvn clean package"
              }
        }
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
                        sh "mvn sonar:sonar"
                    }
                }
            }
        }
    }
}
