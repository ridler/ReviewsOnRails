source 'http://rubygems.org'

gem 'rails', '3.2.15'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
group :test do
  gem 'cucumber-rails', :require => false
  # gem 'cucumber-rails-training-wheels'
end
group :production do
	gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'geocoder'
gem 'gmaps4rails'
gem 'turbolinks'
gem 'twitter'
gem 'twitter-bootstrap-rails'
gem 'therubyracer'
gem 'omniauth-twitter'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml-rails'
