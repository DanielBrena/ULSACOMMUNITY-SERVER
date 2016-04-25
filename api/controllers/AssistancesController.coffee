 # AssistancesController
 #
 # @description :: Server-side logic for managing Assistances
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
moment = require 'moment';
module.exports =
  createAll: (req,res)->
    grupo = req.param 'grupo'
    estudiantes = JSON.parse(req.param 'estudiantes')
    fecha = moment(moment().format("YYYY-MM-DD")).toISOString();
    if req.param 'fecha'
      fecha = req.param 'fecha'
    Assistances.findOne(date:fecha,group:grupo).exec (error,assistance)->
      return res.error 202, 'Ya existe la asistencia del dia ' + fecha if assistance
      for estudiante in estudiantes
        console.log estudiante.assistance
        #console.log estudiante
        Assistances.create(student:estudiante.id,group:grupo,date:fecha,type:estudiante.assistance).exec (error, a)->

          if a
            console.log 'Asistencia creada'
          return

      return res.json 200, message:'Asistencia exitosa.'

    return




  create: (req,res)->
    alumno = req.param 'alumno'
    grupo = req.param 'grupo'
    tipo1 = req.param 'asistenciabool'
    tipo2 = req.param 'asistenciastring'
    fecha = moment(moment().format("YYYY-MM-DD")).toISOString();
    if req.param 'fecha'
      fecha = req.param 'fecha'

    Assistances.findOne(date:fecha,group:grupo,student:alumno,type2:tipo2).exec (error,assistance) ->
      return res.error 404, 'Ya tiene asistencía el alumno.' if assistance
      Assistances.create(student:alumno,group:grupo,type:tipo1,type2:tipo2,date:fecha).exec (error, assistance)->
        return res.json 200,message:'Asistencia exitosa de la fecha ' +fecha
        return res.json 404, 'No se agrego la asistencia'
      return

  check: (req,res)->
    grupo = req.param 'grupo'
    fecha = moment(moment().format("YYYY-MM-DD")).toISOString();
    Assistances.findOne(group:grupo,date:fecha).exec (error, assistance)->
      return res.json 200,status:true, 'Ya pasó lista en el grupo' if assistance
      return res.json 200, status:false, 'No se pasó lista en el grupo'
    return
