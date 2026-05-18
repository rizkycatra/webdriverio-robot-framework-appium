pipeline {
    agent any

    environment {
        DEFAULT_USER = credentials('DEFAULT_USER')
        DEFAULT_PASS = credentials('DEFAULT_PASS')
        REMOTE_URL   = credentials('REMOTE_URL')
        DEVICE_NAME  = credentials('DEVICE_NAME')
        APP_PATH     = credentials('APP_PATH')
        APPIUM_PATH  = '/home/rizkycatra/tools/node24/bin/appium'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Get the codes from GitHub...'
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Activate virtual environment and installing dependencies...'
                sh '''#!/bin/bash
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Create .env File') {
            steps {
                sh '''#!/bin/bash
                    echo "DEFAULT_USER=${DEFAULT_USER}" > .env
                    echo "DEFAULT_PASS=${DEFAULT_PASS}" >> .env
                    echo "REMOTE_URL=${REMOTE_URL}" >> .env
                    echo "DEVICE_NAME=${DEVICE_NAME}" >> .env
                    echo "APP_PATH=${APP_PATH}" >> .env
                '''
            }
        }

        stage('Start Appium Server') {
            steps {
                echo 'Run Appium server...'
                sh '''#!/bin/bash
                    source venv/bin/activate
                    appium --port 4723 --log appium.log &
                    sleep 5
                '''
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Run the tests...'
                sh '''#!/bin/bash
                    source venv/bin/activate
                    robot \
                        --pythonpath resources \
                        --outputdir results \
                        tests/
                '''
            }
        }

        stage('Publish Results') {
            steps {
                echo 'Published the test results...'
                robot(
                    outputPath: 'results',
                    logFileName: 'log.html',
                    reportFileName: 'report.html',
                    outputFileName: 'output.xml',
                    passThreshold: 80.0,
                    unstableThreshold: 60.0
                )
            }
        }
    }

    post {
        always {
            echo 'Cleaning process...'
            sh 'pkill -f appium || true'
            sh 'rm -f .env'
            archiveArtifacts artifacts: 'results/**', allowEmptyArchive: true
        }
        success {
            echo 'All tests Pass!'
        }
        failure {
            echo 'Tests failed. Check the report on Jenkins'
        }
    }
}