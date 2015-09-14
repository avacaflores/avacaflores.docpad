moment = require('moment')
moment.locale('es')
docpadConfig = {
  templateData:
    site:
      title: 'Por puro gusto'
      tagline: 'Tecnología, programación y un poco de electrónica'
      description: ''
      logo: '/img/logo.png'
      url: 'index.html'
      cover: '/img/keyboardnight.jpg'
      author: 'ALFONSO VACAFLORES'
      navigation: [
        {
          name: 'Blog',
          href: '/',
          section: 'home'
        },
        {
          name: 'Acerca de...',
          href: '/about.html',
          section: 'about'
        },
        {
          name: 'Recursos',
          href: '/recursos.html',
          section: 'recursos'
        },
        {
          name: 'Proyectos',
          href: '/proyectos.html',
          section: 'proyectos'
        }
      ]
    author:
      name: 'Alfonso Vacaflores'
      img: '/img/logo.png'
      url: 'avacaflores.github.io'
      location: 'Tarija, Bolivia',
      bio: ''
    getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
    getDescription: -> if @document.description then "#{@document.description} | #{@site.description}" else @site.description
    bodyClass: -> if @document.isPost then "post-template" else "home-template"
    bannerImage: (d) ->
      d = d || @document
      if d.cover then d.cover else '/img/blogging.jpg'
    isCurrent: (l) ->
      if @document.section is l.section  then ' nav-current'
      else if @document.url is l.href then ' nav-current'
      else ''
    excerpt: (p,w) ->
      w = w || 26
      if p.excerpt then p.excerpt else p.content.replace(/<%.+%>/gi, '').split(' ').slice(0, w).join(' ')
    encode: (s) -> encodeURIComponent(s)
    slug: (s) -> return s.toLowerCase().replace(' ', '-')
    currentYear: -> new Date().getFullYear()
    time: (ts, format) ->
      format = format || 'MMMM DO, YYYY'
      ts = new Date(ts) || new Date()
      moment(ts).format(format)
  collections:
    posts: ->
      @getCollection("html").findAllLive({active:true, isPost: true, isPagedAuto: {$ne: true}}, {postDate: -1}).on "add", (model) ->
        model.setMetaDefaults({layout:"post"})
  plugins:
    tags:
      extension: '.html'
      injectDocumentHelper: (doc) ->
        doc.setMeta { layout: 'tag' }
    ghpages:
        deployRemote: 'origin'
        deployBranch: 'master'
}

module.exports = docpadConfig