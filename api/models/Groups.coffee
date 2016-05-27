 # Groups.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models

module.exports =
  schema:true
  attributes: {
    name:
      type:'string'
      unique:true
      required:true
    description:
      type:'string'
      required:true
    status:
      type:'boolean',
      defaultsTo:false
    type:
      type:'string'
      enum:['interno','externo','reposicion']
    students:
      collection:'students'
      via:'groups'
      dominant:true
    activity:
      model:'activities'
    semester:
      model:'semesters'
    assistances:
      collection:'assistances'
      via:'group'
    teacher:
      model:'teachers'
    image:
      type:'string'
  }
