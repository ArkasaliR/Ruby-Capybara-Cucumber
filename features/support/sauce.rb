
if ENV['SAUCY']

  p "Running in SAUCEY mode"

  #require "capybara/rails"
  require 'capybara/cucumber'
  require "sauce/cucumber"
  require "capybara/rspec"
  require 'sauce/parallel'

  #browsers_to_test = ENV['TEST_BROWSER'] || "Windows 7,Internet Explorer,8"
  browsers_to_test = ENV['TEST_BROWSER'] || "Windows 7,Internet Explorer,8\nLinux,Opera,12\nOSX 10.6,Safari,5"
  
  puts "================="
  browsers_to_test = browsers_to_test.split("\n")
  browsers_to_test.map!{|browser| browser.split(',')}
   # Set up configuration
  Sauce.config do |c|
    c[:name] = 'Selfservice Desktop Web Features'
    c[:start_tunnel] = false
    c[:browsers] = browsers_to_test
    puts "running on browsers: #{c[:browsers]}"
  end

  if ENV['WAIT_TIME']
    Capybara.default_wait_time = ENV['WAIT_TIME'].to_i 
  else
    Capybara.default_wait_time = 300
  end

  Capybara.default_driver = :sauce
  Capybara.javascript_driver = :sauce

  if ENV['MOBILE']
    Capybara.current_session.driver.browser.manage.window.resize_to(350, 768) 
  else
    Capybara.current_session.driver.browser.manage.window.resize_to(1024, 768)
    #Capybara.current_session.driver.browser.manage.window.resize_to(999, 768) 
  end

  Around('@desktop') do |scenario, block|
    # driver = ::Capybara.current_session.driver
    Sauce.config do |c|
      c[:name] = 'Selfservice Desktop Web Features'     
    end    
    block.call    
  end

  Around('@tablet') do |scenario, block|
    # driver = ::Capybara.current_session.driver
    Sauce.config do |c|
      c[:name] = 'Selfservice Tablet Web Features'     
    end    
    block.call    
  end
end
