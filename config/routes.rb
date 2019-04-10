# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper
  root to: 'visitors#index'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Base => '/'
  # do not auto mount swagger in production
  mount GrapeSwaggerRails::Engine => '/swagger' unless Rails.env.production?

  # mount if user is admin
  authenticate :user, ->(u) { u.admin? || u.email == Rails.application.secrets.admin_email } do
    mount GrapeSwaggerRails::Engine => '/swagger' if Rails.env.production?
  end

  resources :addresses
end
