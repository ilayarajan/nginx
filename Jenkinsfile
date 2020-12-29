node{
  //Define all variables
  def project = 'nginx-deployment'
  def appName = 'nginx-app'
  def serviceName = "${appName}-backend"  
  def imageVersion = 'nginx'
  def namespace = 'nginx'
  def imageTag = "172.21.224.24:5000/${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"

  
  //Checkout Code from Git
  checkout scm
  
  //Stage 1 : Build the docker image.
  stage('Build image') {
      sh("docker build -t ${imageTag} .")
  }
  //Stage 2 : Push the image to docker registry
  stage('Push image to registry') {
      sh("docker push ${imageTag}")
  }
}
