 # UsersController
 #
 # @description :: Server-side logic for managing Users
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
md5 = require 'md5'
module.exports =
  createStudent: (req,res,next)->
    email = req.param 'email'
    username = req.param 'username'
    password = new Date().getTime().toString().toString 32
    access_level = req.param 'access_level'
    Users.create(email:email,username:username,password:password,access_level:access_level,hash:md5(password)).exec (error, user)->
      res.json 200,user
      return
    return

  active: (req, res)->
    hash = req.param 'hash'
    Users.findOne(hash:hash,active:false).exec (error, user)->
      return res.error 404, 'No se encontro' if !user
      usuario = user
      usuario.active = true
      usuario.save (error)->
        console.log error
      res.json 200, message:'Activado'
      return
