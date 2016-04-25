 # Events.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models

module.exports =
  schema:true
  attributes: {
    title:
      type:'string'
      required:true
    activity:
      model:'activities'
    description:
      type:'string'
    fecha:
      type:'date'
      required:true
    file:
      type:'string'
  }
