# frozen_string_literal: true

module Generators
  class CreateUserService
    def call
      create_user
      create_admin
    end

    def create_user
      User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
      end
    end

    def create_admin
      AdminUser.find_or_create_by!(email: 'admin@example.com') do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
      end
    end
  end
end
