module.exports =
  findGroups: (callback) ->
    Semesters.findOne(active:true).exec (error,semester)->
      Groups.find({semester:semester.id}).populate('students').exec (err,groups)->
        callback null, groups
