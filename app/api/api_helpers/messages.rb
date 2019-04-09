# frozen_string_literal: true

module ApiHelpers
  module Messages
    extend ::Grape::API::Helpers

    def success!(message = '')
      { status: 200, metadata: message }
    end

    def success_empty!(message = '')
      { status: 201, metadata: message }
    end

    def access_denied!(message = '')
      error!({ status: 401, message: "Access Denied. #{message} " }, 401)
    end

    def bad_request!(message = '')
      error!({ status: 400, message: "Bad Request. #{message} " }, 400)
    end

    def forbidden_request!(message = '')
      error!({ status: 403, message: "Forbidden. #{message} " }, 403)
    end

    def not_found!(message = '')
      error!({ status: 404, message: "Not Found. #{message} " }, 404)
    end

    def invalid_request!(message)
      error!({ status: 422, message: "Invalid Request. #{message} " }, 422)
    end

    def conflict!(message)
      error!({ status: 409, message: "Conflict. #{message} " }, 409)
    end

    def invalid_login_attempt(message = '')
      access_denied!(message)
    end
  end
end
