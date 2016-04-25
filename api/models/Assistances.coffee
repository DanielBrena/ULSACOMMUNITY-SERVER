 # Assistances.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models

module.exports =
  schema:true
  attributes: {
    type:
      type:'boolean'
      enum:[true,false]
      defaultsTo:false
    date:
      type:'date'
      required:true
    type2:
      type:'string'
      enum:['asistencia','viernes cultural']
      defaultsTo:'asistencia'
    student:
      model:'students'
    group:
      model:'groups'


  }
