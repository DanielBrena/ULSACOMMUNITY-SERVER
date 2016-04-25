# AuthController
#
# @description :: Server-side logic for managing auths
# @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers

module.exports =
  index: (req,res) ->
    email = req.param 'email'
    password = req.param 'password'
    return res.error 401, 'Correo y contraseña son requeridos.' if !email and !password
    Users.findOne email:email, (error,user) ->
      return res.error 401,'No existe el usuario.' if !user
      Users.comparePassword password, user, (error, valido) ->
        return res.error 403, 'Prohibido el acceso.' if error
        return res.error 401, 'Correo y contraseña son requeridos.' if !valido
        res.json user:user,token:jwToken.issue id:user.id
        return
      return
    return
