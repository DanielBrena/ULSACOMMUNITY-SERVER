module.exports = (req,res, next) ->
  token = ''
  if req.headers and req.headers.authorization
    headers = req.headers.authorization.split ' '
    if headers.length == 2
      schema = headers[0]
      credentials = headers[1]
      bearerPatter = /// ^ Bearer $ ///i
      if schema.match bearerPatter
        token = credentials
    else
      return res.error 401, 'Format is Authorization: Bearer [token]'
      # return res.json 401, {
      #     http_code:401,
      #     message:'UNAUTHORIZED'
      #     errors: [
      #         {
      #           message:'Format is Authorization: Bearer [token]'
      #         }
      #       ]
      #     internal_error_code:0
    	# 		details_url:'http://ulsacommunity.com/'
      #   }
  else if req.param 'token'
    token = req.param 'token'
    delete req.query.token
  else
    return res.error 401, 'Not Authorization header found'
    # return res.json 401, {
    #   http_code:401,
    #   message:'UNAUTHORIZED'
    #   errors: [
    #       {
    #         message:'Not Authorization header found'
    #       }
    #     ]
    #   internal_error_code:0,
    #   details_url:'http://ulsacommunity.com/'
    # }

  jwToken.verify token, (err, token) ->
    console.log token
    if err
      return res.error 401, 'Invalid Token'
      # return res.json 401, {
      #   http_code:401,
      #   message:'UNAUTHORIZED'
      #   errors: [
      #       {
      #         message:'Invalid Token'
      #       }
      #     ]
      #   internal_error_code:0,
      #   details_url:'http://ulsacommunity.com/'
      # }

    return res.error 401, 'Not Authorization' if token.user.access_level != 0

    req.token = token
    next()
