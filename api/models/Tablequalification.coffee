 # Tablequalification.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models

module.exports =
  schema:true
  attributes: {
      assistance:
        type:'float'
        required:true
      credits:
        type:'float'
        required:true
      qualification:
        type:'float'
        required:true
  }
