# If you have a very small app you may be able to
# increase this, but in general 3 workers seems to
# work best
if ENV["RAILS_ENV"] == "development"
  worker_processes 1
else
  worker_processes 3
end

# Load your app into the master before forking
# workers for super-fast worker spawn times
preload_app true

# Immediately restart any workers that
# haven't responded within 30 seconds
timeout 30

before_fork do |server, worker|
  # Replace with MongoDB or whatever
  # if defined?(ActiveRecord::Base)
  #   ActiveRecord::Base.connection.disconnect!
  #   Rails.logger.info('Disconnected from ActiveRecord')
  # end

  # sleep 1
end

after_fork do |server, worker|
  # Replace with MongoDB or whatever
  # if defined?(ActiveRecord::Base)
  #   ActiveRecord::Base.establish_connection
  #   Rails.logger.info('Connected to ActiveRecord')
  # end

end
