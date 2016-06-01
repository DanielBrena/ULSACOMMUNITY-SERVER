 # TeachersController
 #
 # @description :: Server-side logic for managing Teachers
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers

module.exports =
  profile: (req,res) ->
    console.log req.token
    TeachersService.findTeacher req.token.user.id, (error, teacher) ->
      res.json teacher

  statisticsGenderStudents: (req,res)->
    TeachersService.findTeacher req.token.user.id, (error, teacher) ->
      Groups.find(teacher:teacher.id).populate('students').exec (e,s)->
        res.json s


  findByQuery:(req,res)->
    search = req.param 'search'
    console.log 'q : ' +search
    Teachers.find(or:[
      {name:{'contains':search}}
      {lastname:{'contains':search}}
      ]).populate('groups').populate('user').limit(10).exec (e,t)->
        console.log t
        res.json t
        return
    return

  statisticsViernes: (req,res)->
    TeachersService.findTeacher req.token.user.id, (error, teacher) ->
      arreglo = []
      for grupo in teacher.groups
        arreglo.push grupo.id
      Assistances.find({group:arreglo,type2:"viernes cultural"}).exec (err,assistances)->
        res.json assistances
