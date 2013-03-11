Roydon::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  config.log_level = :debug

  # config.logger.level = Logger.const_get(
  #   ENV['LOG_LEVEL'] ? ENV['LOG_LEVEL'].upcase : 'DEBUG'
  # )

  config.assets.precompile += %w( polyfills.js )

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'roydon.fi' }
  # A dummy setup for development - no deliveries, but logged
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  # S3 config for paperclip
  config.paperclip_defaults = {:storage => :s3, :s3_credentials => {access_key_id: ENV['S3_ACCESS'], secret_access_key: ENV['S3_SECRET']}, bucket: "roydon-dev", path: ":attachment/:id/:style.:extension", url: ":s3_domain_url"}
end