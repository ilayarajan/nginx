pipeline {

  environment {
    registry = "172.21.224.24:5000/nginx"
    dockerImage = ""
  }

  agent any
  parameters {
    gitParameter name: 'BRANCH_TAG', 
                 type: 'PT_BRANCH_TAG',
                defaultValue: 'master'
    }

  stages {

    stage('Checkout Source') {
      steps {
        checkout([$class: 'GitSCM',
                          branches: [[name: "${params.BRANCH_TAG}"]], 
                          doGenerateSubmoduleConfigurations: false, 
                          extensions: [], 
                          gitTool: 'Default', 
                          submoduleCfg: [], 
                          userRemoteConfigs: [[url: 'https://ilayarajan@bitbucket.org/ilayarajan/nginx.git']]
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
