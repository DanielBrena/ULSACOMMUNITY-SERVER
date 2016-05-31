 # TablequalificationController
 #
 # @description :: Server-side logic for managing tablequalifications
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers

module.exports =
  getQualification:(req,res)->
    console.log req.body
    assistance = req.param 'assistance'
    console.log assistance
    Tablequalification.findOne(assistance:assistance).exec (err,assistance)->
      console.log assistance
      return err if err
      res.json assistance
