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
            script {
                if ($stack == apply) {
                   echo "run below commands"
                   sh "cd /var/lib/jenkins/workspace/Infra/"
                   sh "terraform plan -out=tfplan -input=false"
                   input 'Apply Plan'
        }
      }
    }
  }
}
}
