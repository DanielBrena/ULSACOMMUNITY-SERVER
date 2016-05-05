###
StatisticsController

@description :: Server-side logic for managing statistics
@help        :: See http://links.sailsjs.org/docs/controllers
###

module.exports =
  allStudents:(req,res)->
    Students.native (error,collection)->
      collection.find({},{}).toArray (e,s)->
        res.json s
  allGroups:(req,res)->
    Groups.native (error,collection)->
      collection.find({},{}).toArray (e,g)->
        res.json g
  allTeachers:(req,res)->
    Teachers.native (error,collection)->
      collection.find({},{}).toArray (e,t)->
        res.json t
  allViernes:(req,res)->
    Assistances.native (error,collection)->
      collection.find({},{type2:'viernes cultural'}).toArray (e,v)->
        res.json v
    #Students.native(function(e,c){c.find({},{}).toArray(function(err,s){console.log(s)})})
  studentsGender: (req,res)->
    Students.native (error, collection)->
      collection.aggregate [$group:{_id:'$gender',count:{$sum:1}}] , (e,r)->
        res.json r
        return
      return
    return

  studentsTeacher: (req,res)->
    genero = req.param 'gender'
    maestro = req.param 'teacher'
    hombres = 0;
    mujeres = 0;
    TeachersService.studentsTeacher maestro,genero, (error, students)->
      res.json count:students


    #Groups.find({teacher:'56bf9a6b8368ac8510c9e7ae'}).populate('students').exec(function(e,s){ cont = 0; for(var i = 0; i < s.length; i++){cont += s[i].students.length} console.log(cont)  });



#Teachers.findOne('56bf9a6b8368ac8510c9e7ae').populate('groups').exec(function(e,g){ var arreglo = []; for(var i = 0; i < g.groups.length;  i++){ arreglo.push(g.groups[i].id); }  Assistances.find({group:arreglo}).exec(function(e,gr){console.log(gr)});   });


  # studentsGender: (req,res)->
  #   Students.native(error, collection)->
  #     collection.aggregate [$group:{_id:'$gender',count:{$sum:1}}] , (e,r)->
  #       res.json r
  #       return
  #     return
  #   return




    #Students.native(function(e,c){c.aggregate([{$group:{_id:'$gender',count:{$sum:1}}}],function(error,result){console.log(result)})});
