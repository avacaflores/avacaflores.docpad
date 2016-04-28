---
title: "Formato en miles y millones para números en SSRS"
cover: '/img/report.jpg'
isPost: true
active: true
excerptOther: ''
postDate: '2016-02-21 20:40:00 -0400'
tags:
 - ssrs
 - vbasic
 - reportes
 - bi
---

A continuación una simple expresión para desplegar un número en formato de miles **K** o millones **M** con dos decimales

````
=iif(Fields!NUMBER.Value>=1000000 , "#,0,,.00"+"M",
iif(Fields!NUMBER.Value>=1000, "#,0,.00"+"K",
iif(Fields!NUMBER.Value>=0,"0.00",
iif(Fields!NUMBER.Value<-1000000, "#,0,,.00"+"M",
iif(Fields!NUMBER.Value<-1000, "#,0,.00"+"K", "0.00")))))
```

Y si se requiere que el formato incluya algún símbolo monetario la expresión necesaria es

``` 
=iif(Fields!NUMBER.Value>=1000000 , "'$' #,0,,.00"+"M",
iif(Fields!NUMBER.Value>=1000, "'$' #,0,.00"+"K",
iif(Fields!NUMBER.Value>=0," '$' 0.00",
iif(Fields!NUMBER.Value<-1000000, "'$' #,0,,.00"+"M",
iif(Fields!NUMBER.Value<-1000, "'$' #,0,.00"+"K", "0.00")))))
```
