# frozen_string_literal: true

require 'faraday'

class Connection
  def self.create(account_url)
    @create ||= Faraday.new(url: "https://#{account_url}") do |faraday|
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
