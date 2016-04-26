###
  jwToken

  @description :: JSON Webtoken Service for sails
  @help        :: See https://github.com/auth0/node-jsonwebtoken & http://sailsjs.org/#!/documentation/concepts/Services
###

jwt = require 'jsonwebtoken'
tokenSecret = 'ulsacommunitywebtoken'
tiempo = expiresInMinutes:180

module.exports.issue = (payload) ->
  jwt.sign payload,tokenSecret,tiempo

module.exports.verify = (token, callback) ->
  jwt.verify token,tokenSecret,{},callback
