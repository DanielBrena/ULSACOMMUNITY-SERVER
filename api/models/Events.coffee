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
    dateStart:
      type:'date'
      required:true
    dateEnd:
      type:'date'
      required:true
    time:
      type:'datetime'
    file:
      type:'string'
  }
