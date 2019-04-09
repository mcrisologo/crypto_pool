# frozen_string_literal: true

require 'faraday'

module Accounts
  class GetConnection
    def self.call(account_url)
      @call ||= Faraday.new(url: "https://#{account_url}") do |faraday|
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end
