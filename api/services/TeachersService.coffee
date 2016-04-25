
module.exports =
  findTeacher: (id,callback) ->
    Semesters.findOne(active:true).exec (error,semester)->
      Teachers.findOne({user:id}).populate('user').populate('groups',{semester:semester.id}).exec (error,teacher) ->
        callback null, teacher
