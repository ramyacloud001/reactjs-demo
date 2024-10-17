pipeline {
    agent any
    triggers {
        githubPush()  // Automatically triggers on push events
    }
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Checkout the develop branch only
                    if (env.GIT_BRANCH == 'origin/dev') {
                        echo "Triggered by push to develop branch"
                    }
                }
                dir('your-folder') {
                    git branch: 'dev', url: 'https://github.com/ramyacloud001/reactjs-demo.git'
                }
            }
        }
        // Additional stages for build, test, deploy can go here
        //
    }
}
