require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'i18n'
require 'active_support'
require 'active_support/core_ext'

# We're going to load the paths to locale files,
I18n.load_path += Dir[File.join(File.dirname(__FILE__), '../../config', 'locales', '*.yml').to_s]
I18n.enforce_available_locales = false

# Load the Test values config file
#require File.join(File.dirname(__FILE__), '../../config', 'initializers', 'test_values.rb').to_s

if ENV['FORCE_SELENIUM'] == "true"
  require 'capybara'
  require "selenium-webdriver"
  if ENV['LOCAL'] == "true"
    ENV['NO_PROXY'] = '127.0.0.1'
  else
    Capybara.register_driver :selenium do |app|
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 600
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.assume_untrusted_certificate_issuer = false
      profile.proxy = Selenium::WebDriver::Proxy.new(:no_proxy => true) unless ENV['WITH_PROXY']
      if (ENV['BROWSER'] == 'chrome')
        Capybara::Selenium::Driver.new(app, :browser => :chrome, :http_client => client)
      else
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile, :http_client => client)
      end
    end
  end

  Capybara.javascript_driver = :selenium
  Capybara.default_driver = :selenium

  if ENV['MOBILE']
    Capybara.current_session.driver.browser.manage.window.resize_to(350, 768) 
  else
    Capybara.current_session.driver.browser.manage.window.resize_to(1024, 768)
    #Capybara.current_session.driver.browser.manage.window.resize_to(999, 768) 
  end

elsif ENV['SAUCY'] != "true"
  # DEFAULT: headless tests with poltergeist/PhantomJS
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
        window_size: [1280, 1024]#,
        #debug:       true
      )
  end
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
end
  
Capybara.default_selector = :css
Capybara.default_wait_time = 60
if ENV['WAIT_TIME']
  Capybara.default_wait_time = ENV['WAIT_TIME'].to_i 
end

World(RSpec::Matchers)
