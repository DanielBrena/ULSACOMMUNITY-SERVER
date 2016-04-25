 # Students.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models

module.exports =
  schema:true
  attributes: {
    registration_number:
      type:'string'
      unique:true
      required:true
    name:
      type:'string'
      required:true
    lastname:'string'
    gender:
      type:'string'
      enum:['hombre','mujer']
    semester:
      type:'integer'
      enum:[1,2,3,4,5,6,7,8,9,10]
    assistances:
      collection:'assistances'
      via:'student'
    groups:
      collection:'groups'
      via:'students'
    career:
      model:'careers'
    user:
      model:'users'
    qualifications:
      collection:'qualifications'
      via:'student'


  }
