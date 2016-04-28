---
title: "Generar reportes SSRS en Excel"
cover: '/img/report.jpg'
isPost: true
active: true
excerptOther: ''
postDate: '2016-01-21 20:40:00 -0400'
tags:
 - ssrs
 - vbasic
 - reportes
 - bi
---

Abrir reportes de SSRS con la funcion `Open URL` es muy sencillo, sin embargo el hacerlo directamente en Excel cuando el reporte tiene parametros resulto ser bastante diferente. A continuación esta la expresión que permite abrir el reporte.rdl directamente en Excel.

``` 
="../_vti_bin/reportserver?" & Globals!ReportFolder &"/reporte.rdl&rs:Format=EXCEL&p_param="+Parameters!param1.Value+"&p_param2="+Parameters!param2.Value
```
