
module.exports =
  findTeacher: (id,callback) ->
    Semesters.findOne(active:true).exec (error,semester)->
      Teachers.findOne({user:id}).populate('user').populate('groups',{semester:semester.id}).exec (error,teacher) ->
        callback null, teacher

  studentsTeacher: (id,gender,callback)->
    criteria = {}
    if gender
      criteria = gender:gender
    Groups.find(teacher:id).populate('students',criteria).exec (error,students)->
      cont = 0
      for student in students
        cont += student.students.length
      callback null, cont
