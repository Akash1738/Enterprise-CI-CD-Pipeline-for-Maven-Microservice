pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    environment {
        IMAGE_NAME = 'akash'
        IMAGE_TAG = '01'
        CONTAINER_NAME = 'akash-app'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/Akash1738/Enterprise-CI-CD-Pipeline-for-Maven-Microservice.git'
            }
        }

        stage('Build Application') {
         
            steps {
               sh 'echo "Starting Maven Build"'
               sh 'mvn clean package -DskipTests -B'
               sh 'echo "Maven Build Completed"'
    }
        }

        stage('Test Docker') {
           steps {
               sh 'docker ps'
    }
}

        stage('Build Docker Image') {
            steps {
                sh 'echo "Starting Docker Build"'
                sh 'docker build -t akash1738/maven-project .'
                sh 'echo "Docker Build Completed"'
    }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                docker run -d -p 8081:8080 --name $CONTAINER_NAME $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }
}
