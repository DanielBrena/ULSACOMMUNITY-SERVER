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
          #if(res)

          console.log res

    return res.json 200, message:'Alumno agregados.'

  addStudent:(req,res)->
    grupo = req.param 'grupo'
    estudiante = req.param 'estudiante'
    Groups.findOne(id:grupo).populate('students').exec (error,group)->
      group.students.add estudiante
      group.save (err,res)->
        console.log res

    return res.json 200, message:'Alumno agregado.'

  removeStudent:(req,res)->
    grupo = req.param 'grupo'
    estudiante = req.param 'estudiante'

    Groups.findOne(id:grupo).populate('students').exec (error,group)->
      if estudiante.id
        group.students.remove estudiante.id
      else
        group.students.remove estudiante
      group.save (err,res)->
        console.log res
      return
    return res.json 200, message:'Alumno removido.'

  

  findGroupsActive:(req,res)->
    GroupsService.findGroups (err, groups)->
      res.json groups
