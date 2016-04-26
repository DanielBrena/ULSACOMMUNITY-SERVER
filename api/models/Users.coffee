 # Users.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models
bcrypt = require 'bcrypt'

module.exports =
  schema:true
  attributes: {

    email:
      type:'email'
      required:true
      unique:true
    hash:
      type:'string'
      unique:'true'
    active:
      type:'boolean'
      defaultsTo:false
    access_level:
      type:'integer',
      enum:[0,1,2]
    username:
      type:'string'
      unique:true
      required:true
    teacher:
      model:'teachers'
    encryptedPassword:
      type:'string'
    student:
      model:'students'
    toJSON:() ->
      obj = @toObject()
      console.log obj
      delete obj.encryptedPassword
      return obj
  }
  beforeCreate: (values, next) ->
    bcrypt.genSalt 10, (err,salt) ->
      return next err if err
      bcrypt.hash values.password, salt, (err, hash) ->
        return next err if err
        values.encryptedPassword = hash;
        next()
        return
      return
        # if values.access_level == 0
        #   user =
        #     username:values.username
        #     password:values.password
        #     email:values.email
        #     hash:values.hash


          #EmailActivateService.enviarActivacion user
      #  values.hash = "12345"

    return

  beforeUpdate: (values, next) ->
    if values.encryptedPassword
      bcrypt.genSalt 10, (err,salt) ->
        return next err if err
        bcrypt.hash values.password, salt, (err, hash) ->
          return next err if err
          values.encryptedPassword = hash;
          next()
    next()
    return

  comparePassword: (password, user, cb) ->
    bcrypt.compare password, user.encryptedPassword, (err, match) ->
      if err
        cb(err)
        return
      if match
        cb(null,true)
      else
        cb(err)
      return
    return
