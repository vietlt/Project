#!/usr/bin/env groovy

pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID="817735295857"
        AWS_DEFAULT_REGION="us-east-1"
        IMAGE_REPO_NAME="repo"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
        AWS_ECR_REGION = 'us-east-1'
        SSH_USER = 'ec2-user'
    }

    stages {
        // Building Docker images
        stage('Building image') {
            steps{
                script {
                    sh '''
                        docker build -t $IMAGE_REPO_NAME .
                    '''
                }
            }
        }

        //test
        stage('Testing') {
            steps{
                script {
                    sh'''
                        echo "Hello"
                        docker images
                    '''
                }
            }
        }

        // Uploading Docker images into AWS ECR
        stage('Pushing to ECR') {
            steps{
                withCredentials(credentials: 'AWS') {
                    script {
                        def login = ecrLogin()
                        sh('#!/bin/sh -e\n' + "${login}") // hide logging
                        if (env.BRANCH_NAME.startsWith('release/')){
                            sh '''
                            aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 817735295857.dkr.ecr.us-east-1.amazonaws.com
                            docker tag repo:latest 817735295857.dkr.ecr.us-east-1.amazonaws.com/repo:latest
                            docker push 817735295857.dkr.ecr.us-east-1.amazonaws.com/repo:latest
                            '''
                        }
                    }
                }
            }
        }
    }

    post{
        always {
            script {
                    mail to: "vietlt215@gmail.com",
                    subject: "Report",
                    body: "Build result for ${currentBuild.currentResult}"
            }       
        }
    }
}

