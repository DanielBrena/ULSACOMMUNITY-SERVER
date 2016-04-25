module.exports = (error,mensaje) ->
  res = @res
  messageDeveloper = ''
  messageUser = ''

  switch error
    when 202
      messageDeveloper = 'ACCEPTED'
      messageUser = 'Aceptado.'

    when 401
      messageDeveloper = 'UNAUTHORIZED'
      messageUser = 'No tienes acceso.'

    when 403
      messageDeveloper = 'FORBIDDEN'
      messageUser = 'Prohibido el acceso.'

    when 404
      messageDeveloper = 'NOT FOUND'
      messageUser = 'No encontrado.'

  res.json error, {
    http_code: error
    messageDeveloper: messageDeveloper
    messageUser: messageUser
    errors: [
        {
          message: mensaje
        }
      ]
    internal_error_code:0
    details_url:'http://ulsacommunity.com/'
  }

      # body...
