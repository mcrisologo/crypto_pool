# frozen_string_literal: true

module Accounts
  class Addresses < Grape::API
    resource :address, desc: 'Address Data' do
      resource :ethereum do
        desc 'Get user addresses'
        get do
          present paginate(current_user.ethereum_addresses), with: Accounts::Address::Entity
        end

        desc 'Get transactions'
        params do
          requires :address, type: String, desc: 'Address'
        end
        get :transaction do
          address = current_user.ethereum_addresses.find_by(address: @data[:address])
          not_found!('Address not found') unless address

          present Accounts::EthereumGroup::GetTransactions.new(address.address).call
        end

        desc 'Create user address'
        params do
          requires :name, type: String, desc: 'Name'
          requires :address, type: String, desc: 'Address'
        end
        post do
          address = current_user.ethereum_addresses.create(@data)
          conflict!(address.errors.messages) unless address.persisted?

          present address, with: Accounts::Address::Entity
        end
      end
    end
  end
end
