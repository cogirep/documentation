# Installation CLI

#### Initialisation
    ibmcloud login --sso

    ibmcloud target -r eu-de

    ibmcloud ks init

    ibmcloud target --cf

    ibmcloud ks workers sonarQ

    ibmcloud cr login

#### Import de l'image dans le répertoire privé
    docker pull sonarqube

    docker tag sonarqube registry.eu-de.bluemix.net/sonarq-namespace/sonarqube:1

    docker push registry.eu-de.bluemix.net/sonarq-namespace/sonarqube:1

    ibmcloud cr image-list

#### Configuration du cluster

    ibmcloud cs region-set eu-central

    ibmcloud cs cluster-config sonarQ

    export KUBECONFIG=/C/Users/SongchirajouSengchan/.bluemix/plugins/container-service/clusters/sonarQ/kube-config-fra02-sonarQ.yml

    kubectl get nodes

    kubectl create -f sonarq-secret.yaml
    kubectl create -f sonarq-configmap.yaml
    kubectl create -f sonarq-deployment.yaml
    kubectl create -f sonarq-service.yaml
    kubectl create -f sonarq-ingress.yaml

    ibmcloud ks workers sonarQ

    kubectl get services

#### Configuration de sonarQ dans la pipeline
1. Pour analyser un projet, cliquer sur le bouton help en haut à gauche de la barre de recherche :
![Lambda project structure](images/projet.png)

2. Onglet Tutorials
![Lambda project structure](images/projet2.png)

3. Rentrer un token et une clé, des paramètres en ligne de commande seront générées :
![Lambda project structure](images/projet3.png)

4. Dans votre pipeline, créer un build de type Maven et entrer le script suivant :
    mvn sonar:sonar [paramètres]
![Lambda project structure](images/pipeline.png)

5. Dans votre répot Bitbucket, placer un fichier pom.xml.
