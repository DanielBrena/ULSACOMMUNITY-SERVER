 # Semesters.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models

module.exports =
  schema:true,
  attributes: {
    name:
      type:'string'
      unique:true
      required:true
    date:
      type:'date'
    active:
      type:'boolean',
      defaultsTo:false
    groups:
      collection:'groups'
      via:'semester'
  }
