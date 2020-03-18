pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
              checkout([$class: 'GitSCM', branches: [[name: '**']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/rahul-inti/Infra.git']]])
            }
        }
        stage('Go') {
            steps {
              sh "sh installterraform.sh"
            }
        }

    stage('Terraform Init') {
        steps {
          sh "cd /var/lib/jenkins/workspace/Infra/"
          sh "terraform init -input=false"
       }
    }

    stage('Terraform Plan') {
     steps {
       sh "terraform plan -out=tfplan -input=false"
     }
   }
   stage('Terraform Apply') {
     steps {
       input 'Apply Plan'
       sh "$terraform apply -input=false tfplan"
     }
   }
  }
}  
