# frozen_string_literal: true

module Users
  class API < Grape::API
    resource :user, desc: 'User Data' do
      desc 'Get user detail'
      get do
        present current_user, with: User::Entity
      end
    end
  end
end
