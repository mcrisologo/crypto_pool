# frozen_string_literal: false

require 'grape'
require 'grape-entity'
require 'grape-swagger'
require 'doorkeeper/grape/helpers'

class Base < Grape::API
  include Grape::Kaminari

  # common Grape settings
  prefix 'api'
  version 'v1', using: :path
  format :json

  rescue_from :all, backtrace: false do |error|
    send_error_response(error)
  end

  helpers Doorkeeper::Grape::Helpers
  helpers ApiHelpers::Auths
  helpers ApiHelpers::Messages
  helpers ApiHelpers::Logs

  before do
    swaggered! || doorkeeper_authorize!

    @data = params.except(:limit, :page, :per_page, :offset, :access_token)
    params[:page] = params[:page].to_i if params[:page]
    params[:per_page] = params[:per_page].to_i if params[:per_page]
    params[:offset] = params[:offset].to_i if params[:offset]

    set_paper_trail_meta
  end

  after do
    reset_paper_trail_meta
  end

  # ---- MOUNT AREA ---- start
  mount Info

  mount Users::API
  # ---- MOUNT AREA ---- end

  add_swagger_documentation api_version: 'v1', hide_documentation_path: true, hide_format: true,
                            info: { title: 'CryptoPool API' }
end
