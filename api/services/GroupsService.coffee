module.exports =
  findGroups: (callback) ->
    Semesters.findOne(active:true).exec (error,semester)->
      Groups.find({semester:semester.id}).populate('students').exec (err,groups)->
        callback null, groups

  findGroupsQuery:(query,callback)->
    Semesters.findOne(active:true).exec (error,semester)->
      Groups.find({name:{'contains':query},semester:semester.id}).populate('students').exec (err,groups)->
        callback null, groups
