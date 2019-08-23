﻿### Documentation Templates-Controllers backend

> **Note:** 
> Les templates ont pour but de simplifier le développement d'appel simple et d'éviter la duplication du code.
> 
> Utilisation:
> 
> 
> >Les templates sont à utilisé dans les cas simple et non spécifique , les développements spécifique seront à faire dans un autre controller (celui de l'objet en question).
> 
> >le service qui accompagne le template doit respecté des règles de nommage afin de pouvoir fonctionné avec celui ci.


-----

-----

-----


### listes des templates disponible avec implémentation.

**getOne:**

Description: Récupération d'un élément via un paramètre

- Implémentation sur la route:

> importer le fichier avec les templates ('app/controllers/template')
>
> le controller se prénomme getOne 
>
> le params peut être modifié (id, email, code ... ) mais un seul peut être présent
>
> le controller prend pour paramètre :
>
>> req => requête 
>> res => réponse
>> service => service de l'objet , il devra OBLIGATOIREMENT avoir les méthodes qui seront listé dans la partie 'Création du service'
>> obj => string: nom de l'objet (il sera utilisé pour le retour personnalisé du type)

*exemple:*

    api.get(  
      '/:id(\\d+)',  
      (req, res, next) => {  
        routesGuard.rightMiddleware([permissionEnum.Administrer], req, res, next);  
      },  
      passport.authenticate('jwt', { session: false }),  
      (req, res) => template.getOne(req, res, accountService, 'ACCOUNT')  
    );

- Création du service:

La création d'un service est obligatoire pour pouvoir utilisé le template .
Pour le bon fonctionnement du template getOne, le service doit contenir la fonction getOne et doit renvoyé soit l'objet voulu ou null.

> getOne
> 
>> le service prend pour paramètre :
>>> params => les paramètre de la requête 

    exports.getOne = params =>  
      Schema.findOne({  
        where: {  
          id: params.id  
	     }  
      });



-----

-----

-----


**get:**

Description: Récupération de tous les éléments avec une pagination

- Implémentation sur la route:

> importer le fichier avec les templates ('app/controllers/template')
>
> le controller se prénomme get
>
> les paramètres de la route pour la pagination(obligatoire) sont:
> > page => le numéro de la page
> > limit => nombre maximum d’élément par page
>
> le controller prend pour paramettre :
>
>> req => requête 
>> res => réponse
>> service => service de l'objet , il devra OBLIGATOIREMENT avoir les méthodes qui seront listé dans la partie 'Création du service'
>> obj => string: nom de l'objet (il sera utilisé pour le retour personnalisé du type)

*exemple:*

	   api.get(  
      '/:page(\\d+)/:limit(\\d+)',  
      (req, res, next) => {  
        routesGuard.rightMiddleware([permissionEnum.Administrer], req, res, next);  
      },  
      passport.authenticate('jwt', { session: false }),  
      (req, res) => template.get(req, res, permissionService, 'PERMISSION')  
    );

- Création du service:

La création d'un service est obligatoire pour pouvoir utilisé le template .

Pour le bon fonctionnement du template get, le service doit contenir la fonction get et doit renvoyé un objet comprenant

=> dans le cas d'une erreur

    {
    	code: 500
    }
  
 => dans le cas d'un succès
 

    {
    	 count: nombre => nombre d'élément
    	 pages: nombre => nombres de pages
    	 list: => tableau => contenant les objets de la requete
     }

exemple de service de pagination: 

    exports.get = async (params, query) => {  
      try {  
        const { page, limit } = params;  
	    let keyword = `%`;  
        let order = [];  
        const offset = limit * (page - 1);  
      
       // if query exist  
       if (Object.getOwnPropertyNames(query).length >= 1) {  
       // if search exist, set search  
       if (query.search) {  
         keyword = `%${query.search}%`;  
      }  
      // if order exist, set order  
       if (query.column && query.order) {  
       // sequelize syntax for order  
        order = [[query.column, query.order]];  
      }  
        }  
        // get number of result  
      const count = await Users.count({  
          where: {  
            [Op.or]: [  
              {  
                email: { [Op.iLike]: keyword }  
              },  
            ]  
          }  
        });  
      
      // find how many page for this request  
      const pages = Math.ceil(count / limit);  
      
      // find with pagination  
      const list = await Users.findAll({  
      // pagination  
      limit,  
      offset,  
      order,  
      include: ['permissions'],  
      where: {  
            [Op.or]: [  
              {  
                email: { [Op.iLike]: keyword }  
              },  
            ]  
          }  
        });  
      
      // return list , the number of page and the number of account  
      return { count, pages, list };  
      } catch (e) {  
        // return error if error  
      return { code: 500, message: 'unknown error' };  
      }  
    };


-----

-----

-----


**create:**

Description: Création d'un élément

- Implémentation sur la route:

> importer le fichier avec les templates ('app/controllers/template')
>
> le controller se prénomme create 
>
> le controller prend pour paramètre :
>
>> req => requête 
>>
>> res => réponse
>>
>> service => service de l'objet , il devra OBLIGATOIREMENT avoir les méthodes qui seront listé dans la partie 'Création du service'
>>
>> schéma => schéma AJV pour la validation des données entrante 
>>
>> obj => string: nom de l'objet (il sera utilisé pour le retour personnalisé du type)
>>
>> unique => boolean: à utilisé dans le cas que l'objet possède une contrainte d'unicité sur un de ses champs, il sert a vérifié que la clés en question est disponible
>>
>> association => boolean: à utilisé dans le cas ou l'on doit associé l’objet à un autre via une table d'association

*exemple:*

    api.post(  
      '/',  
      (req, res, next) => {  
        routesGuard.rightMiddleware([permissionEnum.Administrer], req, res, next);  
      },  
      passport.authenticate('jwt', { session: false }),  
      (req, res) =>  
        template.create(req, res, permissionService, permissionSchema, 'PERMISSION', true, false)  
    );

- Création du service:

La création d'un service est obligatoire pour pouvoir utilisé le template .

Pour le bon fonctionnement du template create , le service doit contenir les fonctions suivantes

> validator 
> 
>> à utilisé dans le cas ou unique est à 'true'
>>
>> le service prend pour paramètre :
>>> body => le body de la requête
>>> id => dans le cas du create il sera toujours à null

Retour du service:

=> dans le cas d’une erreur

```
{
	code: 200
}
```

=> dans le cas d’un succès

```
{
	 code: 400,  
	 message: message personnalisé  
 }
```

exemple de service:

    exports.validator = async (body, id) => {  
      // find user with email  
      const user = await Users.findOne({  
        where: {  
          email: body.email  
      }  
      });  
      // check if user exist , if yes it mean the email already exist  
      if (user === null || (user && id === user.id.toString())) {  
        return {  
          code: 200  
      };  
      }  
      
      return {  
        code: 400,  
      message: 'email already exist'  
      };  
    };

> create 
>> le service prend pour paramètre :
>>> body => le body de la requête

Retour du service:

=> dans le cas d’une erreur

```
erreur
```

=> dans le cas d’un succès
```
l'objet qui vient d'etre crée
```
exemple de service:

    exports.create = body =>  
      Permission.create({  
        ...body  
      });

> addAssociation 
> > utilise uniquement dans le cas ou assocation est à 'true'
> >
>> le service prend pour paramètre :
>>> body => le body de la requête
>>> id => id de l'objet qui vient d’être crée 

le retour de cette fonction n'est pas pris en compte , on ne peut pas catch la méthode sequelize qui permet de crée les associations 

exemple: 

    exports.addAssociation = async (body, id) => {  
      if (body.permissions.length > 0) {  
        // find user  
      const account = await Users.findOne({  
          where: {  
            id  
          }  
        });  
      // add permission to account  
      body.permissions.forEach(async permission => {  
          account.addPermission(permission.id, {  
            through: {  
              status: permission.status  
	      }  
          });  
      });  
      }  
    };


-----

-----

-----

**update:**

Description: modification d'un élément

- Implémentation sur la route:

> importer le fichier avec les templates ('app/controllers/template')
>
> le controller se prénomme update 
>
> les paramètres de la route pour l'update (obligatoire):
> > id => id de l'élément que l'on souhaite update
> 
> le controller prend pour paramètre :
>
>> req => requête 
>>
>> res => réponse
>>
>> service => service de l'objet , il devra OBLIGATOIREMENT avoir les méthodes qui seront listé dans la partie 'Création du service'
>>
>> schéma => schéma AJV pour la validation des données entrante 
>>
>> obj => string: nom de l'objet (il sera utilisé pour le retour personnalisé du type)
>>
>> unique => boolean: à utilisé dans le cas que l'objet possède une contrainte d'unicité sur un de ses champs, il sert a vérifié que la clés en question est disponible
>>
>> association => boolean: à utilisé dans le cas ou l'on doit associé l’objet à un autre via une table d'association

*exemple:*

    api.put(  
      '/',  
      (req, res, next) => {  
        routesGuard.rightMiddleware([permissionEnum.Administrer], req, res, next);  
      },  
      passport.authenticate('jwt', { session: false }),  
      (req, res) =>  
        template.update(req, res, permissionService, permissionSchema, 'PERMISSION', true, false)  
    );

- Création du service:

La création d'un service est obligatoire pour pouvoir utilisé le template .

Pour le bon fonctionnement du template create , le service doit contenir les fonctions suivantes

> validator 
> 
>> à utilisé dans le cas ou unique est à 'true'
>>
>> le service prend pour paramètre :
>>> body => le body de la requête
>>> id => id de l’objet que l'on souhaite modifié

Retour du service:

=> dans le cas d’une erreur

```
{
	code: 200
}
```

=> dans le cas d’un succès

```
{
	 code: 400,  
	 message: message personnalisé  
 }
```

exemple de service:

    exports.validator = async (body, id) => {  
      // find user with email  
      const user = await Users.findOne({  
        where: {  
          email: body.email  
      }  
      });  
      // check if user exist , if yes it mean the email already exist  
      if (user === null || (user && id === user.id.toString())) {  
        return {  
          code: 200  
      };  
      }  
      
      return {  
        code: 400,  
      message: 'email already exist'  
      };  
    };

> update 
>> le service prend pour paramètre :
>>> body => le body de la requête
>>> id => id de l'objet que l'on souhaite modifié

Retour du service:

=> dans le cas d’une erreur

```
erreur
```

=> dans le cas d’un succès
```
l'objet qui vient d'etre modifié
```
exemple de service:

    exports.update = (body, id) =>  
      Users.update(  
        {  
          firstname: body.firstname,  
      lastname: body.lastname,  
      status: body.status,  
      owner: body.owner,  
      consumer: body.consumer  
      },  
      {  
          where: {  
            id  
          },  
      // usually update don't return the updated object  
     // with returning: true it return it  returning: true,  
      plain: true  
      }  
      );

> addAssociation 
> > utilise uniquement dans le cas ou association est à 'true'
> >
>> le service prend pour paramètre :
>>> body => le body de la requête
>>> id => id de l'objet qui vient d’être modifié 

le retour de cette fonction n'est pas pris en compte , on ne peut pas catch la méthode sequelize qui permet de crée les associations 

exemple: 

    exports.addAssociation = async (body, id) => {  
      if (body.permissions.length > 0) {  
        // find user  
      const account = await Users.findOne({  
          where: {  
            id  
          }  
        });  
      // add permission to account  
      body.permissions.forEach(async permission => {  
          account.addPermission(permission.id, {  
            through: {  
              status: permission.status  
	      }  
          });  
      });  
      }  
    };

> removeAssociation 
> > utilise uniquement dans le cas ou association est à 'true'
> > 
> >ce service permet de supprimez les associations précédente 
> >
>> le service prend pour paramètre :
>>> id => id de l'objet qui vient d’être crée 

le retour de cette fonction n'est pas pris en compte , on ne peut pas catch la méthode sequelize qui permet de crée les associations 

exemple: 

    exports.removeAssociation = id => {  
      AccountPermission.destroy({  
        where: {  
          pk_fk_accountid: id  
        }  
      });  
    };

