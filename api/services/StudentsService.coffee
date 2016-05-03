module.exports =
  findStudent: (id,callback) ->
    Semesters.findOne(active:true).exec (error,semester)->
      Students.findOne({user:id}).populate('user').populate('groups',{semester:semester.id}).exec (error,student) ->
        callback null, student
