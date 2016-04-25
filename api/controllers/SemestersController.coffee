# SemestersController
#
# @description :: Server-side logic for managing semesters
# @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers





module.exports = {


  ###
  @api {get} /semesters Acceder a una lista de registros.
  @apiName GetSemesters
  @apiGroup Semesters
  @apiVersion 1.0.0

  @apiParam {String} where={}
  En lugar de filtrar en base a un atributo específico, en su lugar puede optar por proporcionar un parámetro.
  @apiParamExample {json} Ejemplo de petición:
  curl -i http://localhost/semesters?where={"name":{"contains":"semestre 2016"}}

  @apiParam {Number} limit=30
  El número máximo de registros para enviar de vuelta.
  @apiParamExample {json} Ejemplo de petición:
  curl -i http://localhost/semesters?limit=100

  @apiParam {Number} skip=30
  El número de registros a pasar (Usar para la paginacion)
  @apiParamExample {json} Ejemplo de petición:
  curl -i http://localhost/semesters?skip=30

  @apiParam {String} short=''
  El orden de clasificación. De forma predeterminada, los registros devueltos están ordenados por valor de clave principal en orden ascendente.
  @apiParamExample {json} Ejemplo de petición:
  curl -i http://localhost/semesters?createdAt%20DESC

  @apiSuccess {String} name Nombre del semestre.
  @apiSuccess {Date}  date Fecha del semestre.
  @apiSuccess {Boolean} active Semestre actual.
  @apiSuccess {Object[]} groups Lista de grupos del semestre.
  @apiSuccessExample {json} Success-Response: HTTP/1.1 200 OK
  semesters:{
        "name": "Semestre 2016",
        "date": "16-Enero-2016",
        "active": true,
        "groups": []
  }
  ###

  ###
  @api {get} /semesters/:id Acceder a un registro.
  @apiGroup Semesters
  @apiVersion 1.0.0

  @apiParam {String} id El id del semestre
  @apiParamExample {String} Ejemplo de petición:
  curl -i http://localhost/semesters/1


  @apiSuccess {String} name Nombre del semestre.
  @apiSuccess {Date}  date Fecha del semestre.
  @apiSuccess {Boolean} active Semestre actual.
  @apiSuccess {Object[]} groups Lista de grupos del semestre.
  @apiSuccessExample {json} Success-Response: HTTP/1.1 200 OK
  {
        "name": "Semestre 2016",
        "date": "16-Enero-2016",
        "active": true,
        "groups": []
  }

  ###

  ###
  @api {post} /semesters Crear un semestre.
  @apiName PostSemesters
  @apiGroup Semesters
  @apiVersion 1.0.0

  @apiParam {String} name Nombre del semestre.
  @apiParam {Data} date Fecha del semestre.
  @apiParam {Boolean} active Semestre actual.
  @apiParamExample {json} Ejemplo de petición:
  {
        "name": "Semestre 2016",
        "date": "16-Enero-2016",
        "active": true
  }

  @apiSuccess {String} name Nombre del semestre.
  @apiSuccess {Date}  date Fecha del semestre.
  @apiSuccess {Boolean} active Semestre actual.
  @apiSuccess {Date} createdAt Fecha de creación.
  @apiSuccess {Date} updatedAt Fecha de actualización.
  @apiSuccessExample {json} Success-Response: HTTP/1.1 200 OK
  {
    "name": "semester 2016"
    "date": "2016-03-11T00:00:00.000Z"
    "active": true
    "createdAt": "2016-03-13T01:23:13.408Z"
    "updatedAt": "2016-03-13T01:23:13.408Z"
    "id": 1
  }
  ###

}
