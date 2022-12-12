# frozen_string_literal: true

source "https://rubygems.org"
ruby '3.1.2'

gem 'rails', '~> 7.0'

gem 'bootsnap'
gem 'carrierwave', '~> 2.0'
gem 'dotenv-rails'
gem 'importmap-rails'
gem 'jquery-rails'
gem 'line-bot-api'
gem 'meta-tags'
gem "mini_magick"
gem "puma"
gem 'rails-i18n', '~> 7.0', '>= 7.0.5'
gem 'sitemap_generator'
gem 'sorcery'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'tailwindcss-rails', '~> 2.0', '>= 2.0.10'
gem "turbo-rails"

group :development do
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller', '~> 1.0'
  gem 'solargraph', '~> 0.45.0'
end

group :development, :test do
  gem 'bullet', '~> 7.0', '>= 7.0.2'
  gem 'faker'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'mysql2', '~> 0.5.4'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end