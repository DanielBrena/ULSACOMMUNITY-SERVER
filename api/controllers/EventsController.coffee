 # EventsController
 #
 # @description :: Server-side logic for managing events
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
path = require 'path'
module.exports =
  create:(req,res)->
    console.log sails.config.appPath
    console.log req.body
    if req.file 'file'
      req.file('file').upload dirname: sails.config.appPath+'/assets/images/eventos', (error,files)->
        console.log error if error
        if files
          data = JSON.parse(req.param 'data')
          console.log data
          console.log files
        return
      return
    return
    res.json 'si'
