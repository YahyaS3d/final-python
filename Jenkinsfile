pipeline {
  agent {
    node {
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
        sh 'docker build -t yahyasa41/final-python:$BUILD_ID .'
      }
    }

    stage('Run & Test') {
      steps {
        sh 'docker run -d -p 5000:5000 --name yahyasa41/final-python:$BUILD_ID'
        sh 'sleep 6'
        sh 'curl localhost:5000'
      }
    }

    stage('Push to DockerHub') {
      steps {
        withCredentials(blindings:[usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'pass', usernameVariable: 'user')])
        sh "docker login -u $user -p $pass "
        sh 'docker push yahyasa41/final-python:$BUILD_NUMBER'
      }
      }
    }

  }
}
