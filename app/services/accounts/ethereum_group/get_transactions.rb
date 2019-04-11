# frozen_string_literal: true

module Accounts
  module EthereumGroup
    class GetTransactions
      URL = Rails.application.secrets.etherscan_url
      KEY = Rails.application.secrets.etherscan_key

      def initialize(address, count = 20)
        @address = address
        @count = count
      end

      def call
        Rails.cache.fetch(@address, expires_in: 1.minute) do
          fetch_data['result'].take(@count)
        end
      end

      private

      def fetch_data
        response = Connection.create(URL).get do |req|
          req.params['apikey'] = KEY
          req.params['module'] = 'account'
          req.params['action'] = 'txlist'
          req.params['address'] = @address
          req.params['sort'] = 'desc'

          # for some reason, setting endblock will return empty
          req.params['startblock'] = 0
          req.params['endblock'] = 99_999_999
        end
        JSON.parse(response.body)
      end
    end
  end
end
