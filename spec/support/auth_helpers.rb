module AuthHelpers
  def authWithUser (user)
    request.headers['Authorization'] = "Token token=#{user.auth_key}"
  end

  def clearToken
    request.headers['Authorization'] = "Token token="
  end
end
