 # StudentsController
 #
 # @description :: Server-side logic for managing Students
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers

module.exports =
  findByQuery:(req,res)->
    search = req.param 'search'
    Students.find(or:[
      {registration_number:search}
      {name:{'contains':search}}
      {lastname:{'contains':search}}
      ]).populate('groups').limit(10).exec((e,s)->
        res.json({students:s})
        return
        )
    return

  assistancesByGroup:(req,res)->
    id = req.param 'student'
    grupo = req.param 'group'
    Students.findOne(id).populate('assistances',{group:grupo}).exec((e,assistances)->
      console.log assistances
      res.json assistances
      return
      )
    return
