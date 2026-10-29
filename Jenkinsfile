pipeline {
    agent any
    environment {
        STUDENT_NAME = 'Sherniaz Yelemessov'
        IMAGE = 'yelemessov-sherniaz-student-api:v1.0-yelemessov-sherniaz'
    }
    stages {
        stage('Checkout') {
            steps {
                echo "Student: ${STUDENT_NAME} - checkout"
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo "Student: ${STUDENT_NAME} - build"
                sh 'chmod +x gradlew && ./gradlew clean bootJar -x test --no-daemon'
            }
        }
        stage('Test') {
            steps {
                echo "Student: ${STUDENT_NAME} - tests"
                sh './gradlew test --no-daemon'
            }
        }
        stage('Docker Build') {
            steps {
                echo "Student: ${STUDENT_NAME} - docker build"
                sh 'docker build -t ${IMAGE} .'
            }
        }
        stage('Verify') {
            steps {
                sh 'docker image inspect ${IMAGE} > /dev/null && echo "OK: image ${IMAGE} exists (student: ${STUDENT_NAME})"'
                sh 'docker images ${IMAGE}'
            }
        }
    }
    post {
        success { echo "Pipeline SUCCESS for ${STUDENT_NAME}" }
        failure { echo "Pipeline FAILED for ${STUDENT_NAME}" }
    }
}
