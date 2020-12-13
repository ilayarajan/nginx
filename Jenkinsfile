pipeline {

  environment {
    registry = "172.21.224.24:5000/nginx"
    dockerImage = ""
  }

  agent any
  stages {

    stage('Checkout Source') {
       when {
        branch 'master'
        }
      steps {
        git 'https://github.com/ilayarajan/nginx.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( "" ) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "nginx.yml", kubeconfigId: "KUBE_CONFIG")
        }
      }
    }

  }

}
