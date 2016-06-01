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

  addTeacher:(req,res)->
    group = req.param 'group'
    teacher = req.param 'teacher'
    Groups.findOne(id:group).exec (error, group)->
      return error if error
      group.teacher = teacher
      group.save (err,g)->
        res.json g


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

  uploadImage:(req,res)->
    grupo = req.param 'grupo'
    if req.file 'file'
      req.file('file').upload dirname: sails.config.appPath+'/assets/images/grupos', (error,files)->
        return error if error

        file =  files[0].fd.split('/')
        nameFile = file[(file.length - 1)]
        Groups.update({id:grupo},{image:nameFile}).exec (err,group)->
          return err if err
          res.json group


  findGroupsActive:(req,res)->
    GroupsService.findGroups (err, groups)->
      res.json groups

  findGroupsQuery:(req,res)->
    query = req.param 'query'
    console.log query
    GroupsService.findGroupsQuery query, (err,groups)->
      res.json groups
