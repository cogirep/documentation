# Insertion des données à l'aide de l'API POST sur POSTMAN à partir d'un fichier CSV

## Configuration de POSTMAN

  1. Création d'une collection
  2. Création d'une requête POST vers <https://devusermanagement.hyperviseurdevint.par01.containers.appdomain.cloud/api/v1/permissions>
  3. Configuration du "Body" en raw de type JSON :

    {
      "code": "{{code}}",
      "label": "{{label}}",
      "description": "{{description}}",
      "status": "{{status}}"
    }

  4. Sauvegarder
  ![Illustration1](./images/postman.png)

  5. Ouvrir le Runner et choisir un fichier CSV de format :
      code,label,description,status
      TEST001,labeltexte,petite description,ENABLE
![Illustration2](./images/format_csv.png)

  6. Lancer le runner
![Illustration3](./images/postman_runner.png)

![Illustration4](./images/postman_result.png)
