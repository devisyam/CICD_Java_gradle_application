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
                SCANNER_HOME = tool 'sonarqube'
            }
            
            steps{
               script{
                withSonarQubeEnv(credentialsId: 'sonar-auth') {
                      sh '''
                      chmod +x gradlew
                      mvn clean verify sonar:sonar
                      ./gradlew sonarqube
                      '''
                    }

                timeout(5) {
                     def qg = waitForQualityGate()
                      if (qg.status != 'OK') {
                           error "Pipeline aborted due to quality gate failure: ${qg.status}"
                      }
                    }
               }
            }
        }
    }
}
