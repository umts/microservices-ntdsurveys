source 'https://rubygems.org'

gem 'coffee-rails'
gem 'factory_girl_rails'
gem 'haml'
gem 'haml-lint'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'umts-microservices-engine', :git => 'git@github.com:umts/microservices-engine.git', require: 'microservices_engine'
gem 'mysql2'
gem 'rails', '~> 5.0'
gem 'rubocop'
gem 'sass-rails'
gem 'uglifier'
gem 'will_paginate'
gem 'faker'
gem 'prawn'
gem 'prawn-table'

group :production do
  gem 'exception_notification'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-pending', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-passenger', require: false
  gem 'listen', require: false
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'codeclimate-test-reporter', '~> 1.0'
  gem 'mocha'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'timecop'
  gem 'rails-controller-testing'
end
