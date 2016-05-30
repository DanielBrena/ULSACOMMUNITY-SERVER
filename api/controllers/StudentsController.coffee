 # StudentsController
 #
 # @description :: Server-side logic for managing Students
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
winston = require 'winston'
module.exports =
  profile: (req,res) ->
    console.log req.token
    StudentsService.findStudent req.token.user.id, (error, student) ->
      res.json student

  findByQuery:(req,res)->
    winston.level = 'debug';
    winston.log 'info', 'Busqueda';
    search = req.param 'search'
    Students.find(or:[
      {registration_number:search}
      {name:{'contains':search}}
      {lastname:{'contains':search}}
      ]).populate('groups').populate('user').limit(10).exec((e,s)->
        res.json({students:s})
        return
        )
    return

  assistancesByGroup:(req,res)->
    id = req.param 'student'
    grupo = req.param 'group'
    Students.findOne(id).populate('assistances',group:grupo).exec (e, assistances)->
      console.log assistances
      res.json assistances
