module Response
  #render the object in Json format and send along an HTTP status
  #default status code (200)
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end