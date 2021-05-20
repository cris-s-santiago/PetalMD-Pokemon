# Responds with JSON and an HTTP status code
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end