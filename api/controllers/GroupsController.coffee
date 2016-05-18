 # GroupsController
 #
 # @description :: Server-side logic for managing Groups
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers

module.exports =
  addStudents:(req,res)->
    grupo = req.param 'grupo'
    estudiantes = JSON.parse(req.param 'estudiantes')
    Groups.findOne(id:grupo).populate('students').exec (error,group)->
      for estudiante in estudiantes
        console.log estudiante
        group.students.add estudiante.id
        group.save (err,res)->
          console.log res
      
    return res.json 200, message:'Alumno agregados.'

  removeStudent:(req,res)->
    grupo = req.param 'grupo'
    estudiante = req.param 'estudiante'
    Groups.findOne(id:grupo).populate('students').exec (error,group)->
      group.students.remove estudiante.id
      group.save (err,res)->
        console.log res
      return
    return res.json 200, message:'Alumno removido.'
