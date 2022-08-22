
helm repo add jenkins https://charts.jenkins.io
helm repo update

helm upgrade --install myjenkins jenkins/jenkins -n jenkins --set "controller.serviceType=LoadBalancer" 

# Jenkins-Shared-Library
Jenkins setup and running on below URL
a65f83ec486cf4c47aed6e89eaba2f59-709568824.eu-west-1.elb.amazonaws.com

