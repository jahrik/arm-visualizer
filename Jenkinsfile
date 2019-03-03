#!/usr/bin/env groovy

node('armv7l') {

    try {

        stage('build') {
            deleteDir()
            checkout scm
            sh "make"
        }

        stage('test') {
            echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
        }

        stage('push') {
            sh "make push"
        }

    } catch(error) {
        throw error

    } finally {

    }
}

node('manager') {

    try {

        stage('scm') {
            deleteDir()
            // Checkout the app at the given commit sha from the webhook
            checkout scm
        }

        stage('deploy') {
            sh "make deploy"
        }

    } catch(error) {
        throw error

    } finally {

    }
}
