source :rubygems

ruby '1.9.3'
gem 'rails', '3.2.11'

gem 'mongoid', '~> 3.0' # MongoDB
gem 'mongoid-ancestry', '~> 0.3' # tree structure of categories
gem 'mongoid-paperclip', '~> 0.0', require: 'mongoid_paperclip' # attaching images

gem 'devise', '~> 2.2' # User control
gem 'rails_admin' # Admin view
gem 'bootstrap-wysihtml5-rails', '~> 0.3' # WYSIWYG for admin view

group :production, :staging do
  gem 'thin', '~> 1.5.0' # Webserver
  gem 'newrelic_rpm' # Statistics
  gem 'dalli', '~> 2.5.0'
  gem 'google-analytics-rails'
end

gem 'aws-sdk', '~> 1.8' # Online storage
gem 'kaminari', '~> 0.14' # Pagination
gem 'money-rails' # Money objects
gem 'ccsv' # Parsing of CSV
gem 'best_in_place'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request' # Binding with RailsPanel in chrome
  gem 'bullet'
  gem 'sextant' # see routes at /rails/routes
end

group :development, :test do
  gem 'rspec', '> 2.1'
  gem 'rspec-rails'
  gem 'rails3-generators'
end

group :test do
  gem 'webrat'
  gem 'autotest-standalone'
  gem 'autotest-rails-pure'
  gem 'autotest-fsevent'
  gem 'autotest-growl'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  # gem 'therubyracer', :platform => :ruby
  gem 'factory_girl_rails'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem 'compass-h5bp'
  gem 'yui-compressor'
end

gem 'haml-rails'
gem 'jquery-rails'
gem 'html5-rails'


# To use debugger
# gem 'ruby-debug'

gem 'strong_parameters' # Emulate Strong parameters for Rails 4
