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


      #populate('students').exec(function(e,s){ console.log(s)  });

  statisticsViernes: (req,res)->
    TeachersService.findTeacher req.token.user.id, (error, teacher) ->
      arreglo = []
      for grupo in teacher.groups
        arreglo.push grupo.id
      Assistances.find({group:arreglo,type2:"viernes cultural"}).exec (err,assistances)->
        res.json assistances
