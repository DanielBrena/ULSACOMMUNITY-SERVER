# EventsController
#
# @description :: Server-side logic for managing events
# @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
path = require 'path'
module.exports =

  getEventos:(req,res)->
    diffusion = JSON.parse(req.param 'diffusion')
    groups = JSON.parse(req.param 'groups')
    console.log diffusion
    console.log groups
    Events.find(or:[

      ##{diffusion:diffusion}
      {type:{'contains':['evento','aviso']}}
      ],group:groups,diffusion:diffusion).exec (err,events)->
        res.json events





  suscription:(req,res)->
    #console.log req
    room = "events"
    return res.badRequest() if !req.isSocket
    sails.sockets.join req,room,(err)->
      return res.serverError(err) if err
      return res.json message:"Suscrito a eventos"




  create:(req,res)->

    console.log req.body
    data = req.body
    if req.file && data.file != 'null' 
      console.log data.file

      req.file('file').upload dirname: sails.config.appPath+'/assets/images/eventos', (error,files)->
        console.log files
        return error if error
        file =  files[0].fd.split('/')
        nameFile = file[(file.length - 1)]
        Events.create(title:data.title,description:data.description,dateStart:data.dateStart,dateEnd:data.dateEnd,file:nameFile,type:data.type,group:data.group,diffusion:data.diffusion).exec (err,event)->
          return err if err
          sails.sockets.broadcast('events', 'events', event);
          res.json event
        return
    else
      Events.create(data).exec (err,event)->
        return err if err
        sails.sockets.broadcast('events', 'events', event);
        res.json event



#    res.json data
  #  console.log data.file
  #  if data.file != 'null' && data.file && data.file != undefined && req.file 'file'
  #    console.log 'entra'
  #  #if req.body.file != 'null' || req.body.file != 'undefined' || data.file != null
  #    if req.file 'file'
  #      req.file('file').upload dirname: sails.config.appPath+'/assets/images/eventos', (error,files)->
  #        return error if error
   #
   #
  #        file =  files[0].fd.split('/')
  #        nameFile = file[(file.length - 1)]
  #        #console.log files[0].fd.split('/')[files[0].fd.split('/').size-1]
  #        Events.create(title:data.title,description:data.description,dateStart:data.dateStart,dateEnd:data.dateEnd,file:nameFile,type:data.type,group:data.group,diffusion:data.diffusion).exec (err,event)->
  #          return err if err
  #          sails.sockets.broadcast('events', 'events', event);
  #          res.json event
  #      return
  #  else
  #    console.log 'aqui'
  #    console.log data
  #    Events.create(data).exec (err,event)->
  #      return err if err
  #      sails.sockets.broadcast('events', 'events', event);
  #      res.json event
