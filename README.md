# Personal website 

## Getting Started

- [Install DocPad](https://github.com/bevry/docpad)

- Clone the project and run the server
``` bash
mkdir my-website
cd my-website
docpad run --skeleton casper
```

- Install moment plugin
``` bash
docpad install moment
```

- [Open http://localhost:9778/](http://localhost:9778/)

- Start hacking away by modifying the `src` directory

## Deploy
``` bash
docpad deploy-ghpages --env static
```
