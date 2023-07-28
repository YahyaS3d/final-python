pipeline {
  agent {
    label 'docker'
  }
  stages {
    stage('checkout') {
      steps {
        git(url: 'https://github.com/YahyaS3d/final-python.git', branch: 'main', changelog: true, poll: true)
      }
    }

    stage('Build') {
      steps {
        sh '"docker build -t flask-app:${env.BUILD_ID} ."'
      }
    }

    stage('Run & Test') {
      steps {
        sh "docker run --name flask-app -d -p 5000:5000 flask-app:${env.BUILD_NUMBER}"
        sh 'sleep 5'
        sh 'curl http://localhost:5000/api/doc'
        sh 'docker stop flask-app && docker rm flask-app '
      }
    }

    stage('Push to DockerHub') {
      steps {
        withCredentials(bindings: [usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
          sh "docker tag flask-app:${env.BUILD_NUMBER} yahyasa41/flask-app:${env.BUILD_NUMBER}"
          sh "docker login -u $user -p $pass "
          sh "docker push yahyasa41/flask-app:${env.BUILD_NUMBER}"
        }

      }
    }

  }
}