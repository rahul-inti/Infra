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
            sh  '''#!/bin/bash
                      cd /var/lib/jenkins/workspace/Infra/
            '''
      }
    }
   }
 }
}
