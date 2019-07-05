# AirBnB Custom

```
'no-underscore-dangle': ["error", { "allow": ["_id"] }]
```

Autorise le underscore uniquement pour `_id`

```
'max-len': ["error", { "code": 150 }]
```

Porte la limite de caractère sur une ligne à 150

```
'no-plusplus': ["error", { "allowForLoopAfterthoughts": true }],
```
Autoriser l'utilisation du `++` uniquement pour les boucle

```
'prefer-destructuring': [
  'error', {
    'array': false,
    'object': false,
  }, {
    'enforceForRenamedProperties': false,
  }]
```

Désactiver la déstructuration des tableau et des objets

[Doc](https://eslint.org/docs/rules/prefer-destructuring)

```
'no-param-reassign': ["error", { "props": false }]
```

Autorise la réaffectation des paramètres de fonction


```
'no-unused-expressions': ["error", { "allowTernary": true }]
```

Autorise les expressions ternaires 

```
'no-restricted-syntax': ["error", "BinaryExpression[operator='in']"]
```

Désactiver les boucles `for in`

```
“no-console”: [
     true,
     “info”,
     “time”,
     “timeEnd”,
     “trace”
   ]
```

Interdit l'utilisation de `console`