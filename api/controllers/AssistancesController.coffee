 # AssistancesController
 #
 # @description :: Server-side logic for managing Assistances
 # @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
moment = require 'moment';
excel = require 'excel-export'
module.exports =
  createAll: (req,res)->
    grupo = req.param 'grupo'
    estudiantes = JSON.parse(req.param 'estudiantes')
    fecha = moment(moment().format("YYYY-MM-DD")).toISOString()#new Date(2016,3,28).toISOString()##
    if req.param 'fecha'

      fecha = req.param 'fecha'
      #fecha = new Date(fecha)
      fecha = moment(fecha, "YYYY-MM-DD").toISOString();

      console.log fecha

    Assistances.findOne(date:fecha,group:grupo).exec (error,assistance)->
      return res.error 404, 'Ya existe la asistencia del dia ' + fecha if assistance
      for estudiante in estudiantes
        #console.log estudiante

        Assistances.create(student:estudiante.id,group:grupo,date:fecha,type:estudiante.assistance).exec (error, a)->
          console.log error if error
          if a
            console.log 'Asistencia creada'

          return

      return res.json 200, message:'Asistencia exitosa.'

    return

  deleteAll:(req,res)->
    grupo = req.param 'grupo'
    fecha = req.param 'fecha'
    fecha = moment(fecha, "YYYY-MM-DD").toISOString();

    Assistances.destroy({group:grupo,date:fecha,type2:'asistencia'}).exec (error, assistance)->
      return res.error 404, 'Error al eliminar la asistecia' if error
      return res.json 200, message:'Asistencias eliminadas'



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

  getAssistances: (req, res)->
    grupo = req.param 'group'
    tipo = req.param 'type'
    Assistances.find(group:grupo,type2:tipo).exec (error,assistances)->
      res.json assistances

  getAssistancesType: (req,res)->
    tipo = req.param 'type'
    console.log tipo
    Assistances.find(type2:tipo).exec (error,assistances)->
      res.json assistances


  export:(req, res)->
    dia = req.param 'dia'
    mes = req.param 'mes'
    anio = req.param 'anio'
    fecha = req.param 'date'#new Date(2016,3,15).toISOString()
    console.log fecha
    conf = {}
    conf.name = 'Reporte'
    conf.cols =
      [{
        caption:'Matricula'
        type:'string'
      }
      {
        caption:'Nombre'
        type:'string'
        beforeCellWrite: (row,cellData)->
          cellData.toUpperCase()
      }
      {
        caption:'Apellidos'
        type:'string'
        beforeCellWrite: (row,cellData)->
          cellData.toUpperCase()
      }
      {
        caption:'Sexo'
        type:'string'
        beforeCellWrite: (row,cellData)->
          cellData.toUpperCase()
      }
      {
        caption:'Grupo'
        type:'string'
        beforeCellWrite: (row,cellData)->
          cellData.toUpperCase()
      }
      {
        caption:'Fecha de viernes cultural'
        type:'string'
      }
      {
        caption:'Fecha de creación'
        type:'string'
      }]
    rows = []
    Assistances.find(type2:'viernes cultural',date:new Date(fecha)).populate('student').populate('group').exec (error,assistances)->
      for assistance in assistances
        alumno = []
        alumno.push assistance.student.registration_number
        alumno.push assistance.student.name
        alumno.push assistance.student.lastname
        alumno.push assistance.student.gender
        alumno.push assistance.group.name
        alumno.push assistance.date
        alumno.push assistance.createdAt
        rows.push alumno
      conf.rows = rows
      result = excel.execute conf
      res.setHeader 'Content-Type', 'application/vnd.openxmlformats'
      res.setHeader "Content-Disposition", "attachment; filename=" + "Report.xlsx"
      res.end result, 'binary'
      return
    return
