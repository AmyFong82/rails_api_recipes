module ExceptionHandler
  #provides the more graceful 'included' method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ error: "Recipe does not exist"}, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      if e.message.match(/Name/)
        json_response({error: "Recipe already exists"}, :bad_request)
      else
        json_response({ error: e.message}, :unprocessable_entity)
      end
    end
  end
end