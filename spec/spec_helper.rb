require 'capybara'
require 'capybara/mechanize'

require 'sinatra'
require 'spec'

require 'capybara/spec/extended_test_app'

# TODO move this stuff into capybara
require 'capybara/spec/driver'
require 'capybara/spec/session'

alias :running :lambda

Capybara.default_wait_time = 0 # less timeout so tests run faster

Spec::Runner.configure do |config|
  config.after do
    Capybara.default_selector = :xpath
  end
end

# Until this library is merge with capybara there needs to be local app and you need to add
# 127.0.0.1 capybara-testapp.heroku.com to your host file
# Run the app with the following line: 
# ruby -rrubygems lib/capybara/spec/extended_test_app.rb
REMOTE_TEST_HOST = "capybara-testapp.heroku.com"
REMOTE_TEST_URL = "http://#{REMOTE_TEST_HOST}:8070"
