pipeline {
  agent {
    node {
      label 'docker'
    }

  }
  stages {
    stage('checkout code') {
      steps {
        echo 'success'
      }
    }

    stage('Build') {
      steps {
        echo 'built'
      }
    }

    stage('Test') {
      steps {
        echo 'tested'
      }
    }

    stage('Push to DockerHub') {
      steps {
        echo 'pushed'
      }
    }

  }
}