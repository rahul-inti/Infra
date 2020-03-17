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
          sh "export AWS_ACCESS_KEY_ID=AKIAI7D6NB6RHKHNCY2A"
          sh "export AWS_SECRET_ACCESS_KEY=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" 
          sh "cd /var/lib/jenkins/workspace/Infra/"
          sh "terraform plan -out=tfplan -input=false"
      }
    }
    stage('Terraform Apply') {
        steps {
          input 'Apply Plan'
          sh "cd /var/lib/jenkins/workspace/Infra/"
          sh "terraform $stack -input=false tfplan"
      }
    }
  }
}
