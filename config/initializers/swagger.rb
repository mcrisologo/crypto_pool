# frozen_string_literal: true
GrapeSwaggerRails.options.url      = '/api/v1/swagger_doc.json'
GrapeSwaggerRails.options.app_url  = ''
GrapeSwaggerRails.options.app_name = 'CryptoPool'
GrapeSwaggerRails.options.headers['Authorization'] = Rails.application.secrets.swagger_auth
