module JsonWebToken
  def encode(payload, expiration)
    payload[:exp] = expiration.to_i
    return JWT.encode(payload, Rails.application.secret_key_base)
  end

  def decode(token)
    body = JWT.decode(token, Rails.application.secret_key_base)
    return body[0]
  end
end
