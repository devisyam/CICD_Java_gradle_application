pipeline{
    agent any
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
        stage("sonar qube analysis"){
            agent{
               docker {
                    image 'openjdk:11'
               }
            }
            environment {
                SCANNER_HOME = tool 'sonar-scanner'
                    script{
                        withSonarQubeEnv(credentialsId: 'sonar-auth') {
                            sh '''
                                chmod +x gradlew
                                ./gradlew sonarqube
                      '''
                        }
                    }
            }
        }
    }
}
