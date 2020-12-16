pipeline {

  environment {
   registry = "172.21.224.24:5000/nginx"
   registryCredential = "docker-creds"
   dockerImage = ""
  }

  agent any
  stages {

    stage('Code Checkout') {
      steps {
          checkout([
            $class: 'GitSCM',
            branches: [[name: '*/master']],
            userRemoteConfigs: [[url: 'https://github.com/ilayarajan/nginx.git']]
            ])
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
          docker.withRegistry( '', registryCredential ) {
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
