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
    group:
      model:'groups'
    description:
      type:'string'
    dateStart:
      type:'date'
      required:true
    dateEnd:
      type:'date'
      required:true
    file:
      type:'string'
    diffusion:
      type:'string',
      enum:['todos','maestros','grupos']
    type:
      type:'string'
      enum:['evento','aviso']

  }
