pipeline {
    agent any

    tools {
        maven 'maven-3.9' // Name of the Maven installation configured in Jenkins
    }

    environment {
        SCANNER_HOME = tool name: 'sonar-scanner' // Name of the SonarQube Scanner installation in Jenkins
    }

    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    git url: 'https://github.com/ichrakmoumen/APP-BACK.git', branch: 'main'
                }
            }
        }
        stage('Compile') {
            steps {
                bat "mvn compile"
            }
        }
        stage('Unit Tests') {
            steps {
                bat "mvn test"
            }
        }
        stage('Sonarqube Analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    script {
                        echo "SCANNER_HOME is set to: ${SCANNER_HOME}"
                        bat '''
                        echo Checking if sonar-scanner exists
                        if exist "%SCANNER_HOME%\\bin\\sonar-scanner.bat" (
                            echo sonar-scanner found
                            "%SCANNER_HOME%\\bin\\sonar-scanner.bat" -Dsonar.url=http://localhost:9000/ -Dsonar.login=squ_ced4199be02718ecc440a5fedc885c908a22d9a8 -Dsonar.projectName=APP-BACK -Dsonar.java.binaries=. -Dsonar.projectKey=APP-BACK
                        ) else (
                            echo sonar-scanner not found
                            exit 1
                        )
                        '''
                    }
                }
            }
        }
        stage('OWASP Dependency Check') {
            steps {
                dependencyCheckPublisher pattern: 'DC'
            }
        }
    }
}
