 # TeachersController
 #
 # @description :: Server-side logic for managing Teachers
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers

module.exports =
  profile: (req,res) ->
    console.log req.token
    TeachersService.findTeacher req.token.id, (error, teacher) ->
      res.json teacher
