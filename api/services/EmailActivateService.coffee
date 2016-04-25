sendgrid = require("sendgrid")("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");
email = new sendgrid.Email();
module.exports =
  enviarActivacion: (user) ->
    email.addTo(user.email);
    email.setFrom("support@ulsacommunity.com");
    email.setSubject("Activa tu cuenta");
    html = '<h2><b>Bienvenido a ULSACOMMUNITY</b></h2><br/>'
    html += '<p><b>Tu matricula es: </b>' +  user.username + '</p><br/>'
    html += '<p><b>Tu contraseña es: </b>' + user.password + '</p><br/>'
    html += '<p>Activa tu cuenta en el siguiente link: </p><br/>'
    html += '<a href="http://localhost:1337/active/">http://localhost:1337/active/' + user.hash + '</a>'

    email.setHtml(html)

    sendgrid.send email, (email,s) ->
      console.log email
      console.log s
