# EventsController
#
# @description :: Server-side logic for managing events
# @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
path = require 'path'
module.exports =
  suscription:(req,res)->
    console.log req
    room = "events"
    return res.badRequest() if !req.isSocket
    sails.sockets.join req,room,(err)->
      return res.serverError(err) if err
      return res.json message:"Suscrito a eventos"




  create:(req,res)->

   #console.log sails.config.appPath
   console.log req.body
   data = req.body
   if req.body.file != 'null'
     if req.file 'file'
       req.file('file').upload dirname: sails.config.appPath+'/assets/images/eventos', (error,files)->
         return error if error


         file =  files[0].fd.split('/')
         nameFile = file[(file.length - 1)]
         #console.log files[0].fd.split('/')[files[0].fd.split('/').size-1]
         Events.create(title:data.title,description:data.description,dateStart:data.dateStart,dateEnd:data.dateEnd,file:nameFile).exec (err,event)->
           return err if err
           sails.sockets.broadcast('events', 'events', event);
           res.json event
       return
   else
     Events.create(data).exec (err,event)->
       return err if err
       sails.sockets.broadcast('events', 'events', event);
       res.json event
