source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'json'
gem 'rake'

# Gem for NoSQL DB
gem 'redis'

# Gem for Webserver
gem 'thin'

group :develpoment, :test, :cucumber do
	gem 'rspec'
    gem 'rspec-rails'
end

group :test do
    gem 'webrat'
    gem 'autotest'
    gem 'autotest-rails-pure'
    gem 'autotest-fsevent'
    gem 'autotest-growl'
end

group :cucumber do
	gem 'capybara'
  	gem 'database_cleaner'
  	gem 'cucumber-rails'
  	gem 'cucumber'
  	gem 'spork'
  	gem 'launchy'    # So you can do Then show me the page
end
  
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

