---
title: "Git shortcuts"
cover: '/img/git.jpg'
isPost: true
active: true
excerptOther: ''
postDate: '2015-09-07 12:42:44 -0400'
tags:
 - git
---

Git es un mundo lleno de comandos que deben ser utilizados en la consola, se me hace muy difícil poder recordar muchos de ellos y termino utilizando siempre los los básicos. 
Hace unos días encontré un tutorial [Git Inmersion](http://gitimmersion.com/index.html) el cual es bastante corto pero muy bien estructurado.

En este tutorial encontré una sección donde el autor hace referencia a un comando para obtener el log en un formato muy adecuado.

``` ini
git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
```

El resultado de este comando es muy conciso y de fácil lectura

``` ini
$ git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
* a1189df 2014-10-25 | Added a comment (HEAD, master) [Jim Weirich]
* 6083cb8 2014-10-25 | Added a default value [Jim Weirich]
* b24f3ff 2014-10-25 | Using ARGV [Jim Weirich]
* cf466b4 2014-10-25 | First Commit [Jim Weirich]
```

Como comprenderán seria casi imposible utilizar este comando cada vez que necesitamos consultar el log, por lo que lo ideal es grabarlo en nuestro `.gitconfig` dentro de la sección de `[alias]` para poder tenerlo disponible mediante un comando simple como por ejemplo

##### .gitconfig
``` ini
[alias]
hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
```

De esta manera usaremos este comando utilizando el shortcut `git hist`

