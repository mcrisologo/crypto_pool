# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.0'
gem 'puma', '~> 3.7'
gem 'rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# frontend
gem 'bootstrap', '~> 4.0.0'
gem 'coffee-rails', '~> 4.2'
gem 'high_voltage'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# db and auths
gem 'devise'
gem 'paper_trail'
gem 'pg', '~> 0.18'

# api
gem 'doorkeeper'
gem 'grape'
gem 'grape-entity'
gem 'grape-kaminari'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'kaminari'
gem 'kaminari-grape'
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem 'better_errors'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_layout'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'

  # code doctors
  gem 'annotate'
  gem 'rubocop'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails', '4.11'
  gem 'faker'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
end
