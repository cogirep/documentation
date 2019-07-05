#!/bin/sh
ibmcloud login -a https://api.eu-de.bluemix.net --sso
ibmcloud cs region-set eu-central
ibmcloud cs cluster-config HyperviseurDevInt
export KUBECONFIG=/Users/fchouteau/.bluemix/plugins/container-service/clusters/HyperviseurDevInt/kube-config-par01-HyperviseurDevInt.yml
ibmcloud cr login