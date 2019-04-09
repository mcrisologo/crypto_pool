# frozen_string_literal: true

module ApiHelpers
  module Auths
    extend ::Grape::API::Helpers

    def warden
      env['warden']
    end

    def send_error_response(error)
      status, msg = detect_error(error)
      Rack::Response.new({ status: status, message: msg }.to_json, status)
    end

    def detect_error(error)
      msg = 'Not Found'

      case error
      when ActiveRecord::RecordNotFound
        status = 404
      when ArgumentError
        status = 400
      else
        status = 500
        msg = 'Internal Server Error. Check your parameters.'
      end
      msg << " -- EXCEPTION MSG: #{error.message}"

      [status, msg]
    end

    def swaggered!
      headers['Authorization'] == Rails.application.secrets.swagger_auth
    end

    def swaggered_user
      user ||= User.first
      user
    end

    def doorkeeper_user
      User.find_by(id: doorkeeper_token.resource_owner_id)
    end

    def current_user
      # maybe setup a demo data
      @current_user ||= doorkeeper_user if doorkeeper_token
      @current_user ||= swaggered_user if swaggered!
      forbidden_request!('User does not exist') unless @current_user.present?

      @current_user
    end
  end
end
