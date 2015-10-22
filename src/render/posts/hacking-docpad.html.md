---
title: "Hacking DocPad"
cover: '/img/docpad.png'
isPost: true
active: true
excerptOther: ''
postDate: '2015-09-13 11:14:44 -0400'
tags:
 - docpad
 - node.js
 - blog
---

La primera versión de este blog fue desarrollada en **Octopress**, una plataforma muy interesante pero poco ágil desarrollada sobre JeKyII. Todos los procesos de actualización se sentían muy pesados y los tenia que re-descubrir cada vez que quería aumentar un post. Adicionalmente note que Octopress no estaba siendo actualizado ya que la versión disponible era de 2011, el sitio de Octopress anuncia desde hace varios meses una nueva versión pero esta no llega todavía.

Estas situaciones me obligaron a buscar una nueva plataforma de generación de sitios estáticos, es en esta búsqueda que encontré [DocPad](http://docpad.org), que es una plataforma basada en node.js, es una plataforma de generación de sitios estáticos muy fácil de adaptar mediante plugins. Un factor decisivo en la elección fue ver que las actualizaciones era bastante recientes y que cuenta con una comunidad muy activa.

El proceso de migración fue bastante simple "en realidad no había mucho que migrar del sitio antrior :-)", sin embargo como en todo desarrollo web la parte de diseño fue mi principal obstáculo.

### Primer paso

El primer paso después de la instalación propia del sistema fue la instalación de una plantilla o **skeleton** la escogida después de muchas pruebas fue: [Casper](https://github.com/docpad/docpad-skeleton-casper). Este skeleton no forma parte de los básicos que se pueden instalar con el sistema, sin embargo me parecio baste adecuado. Encontre varias fallas en el código, pero en líneas geneales el skeleton esta muy bien logrado.

### Segundo paso 

Fue enlazar mi repositorio Git a **GitHub Pages**, un proceso que sorprendentemente me tomo bastante tiempo pero por surte resulto siendo bastante sencillo “cuando encuentras la configuración correcta”

### Tercer paso

En ese momento tome un par de días para entender los alcances del skeleton y como podría modificarlo para darle un toque personal, hice modificaciones al formato de fecha, traducción de algunos etiquetas al español, y principalmente cambios estéticos en el estilo.También optimice bastante los *partials* y *layouts* que venían en el skeleton.
 
En este momento puedo decir que estoy bastante satisfecho con lo que he aprendido y las modificaciones que he realizado, estoy muy lejos todavía de conocer los detalles internos de la plataforma pero estoy bien encaminado. 

El código de todo este blog se encuentra disponible en un repositorio en [GitHub](https://github.com/avacaflores/avacaflores.github.io)

En los siguientes días estaré comentado algunas de las principales modificaciones que he realizado.



