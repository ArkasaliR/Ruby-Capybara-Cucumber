#encoding: utf-8

#Before do
#Capybara.reset_sessions!
#end

#  if scenario.failed?
#    save_page
#  end
#end

counter=0
current_path = "#{I18n.t 'screenshots.path'}"

AfterStep do |scenario|
    scenario_name="#{scenario.name}".downcase.tr!(" ", "_")
    if ENV['SCREENSHOT'] == "all"
      counter_string = counter += 1
      counter_string = "0#{counter}" if counter < 10
      filename = "#{current_path}#{scenario_name}-step-#{counter_string}.png"
      Capybara.save_screenshot(filename)
    end
end

After do |scenario|
  scenario_name="#{scenario.name}".downcase.tr!(" ", "_")
  if scenario.failed?
    if ENV['SHOW_PAGE_ON_ERROR']
       filename = "#{current_path}#{scenario_name}-failed.png"
	     Capybara.save_screenshot(filename)
    end
    step %Q{I logout} if @login == "true"
  end
  counter=0
end

Before do |scenario|
  @scenario_name="#{scenario.name}".downcase.tr!(" ", "_")
  @scenario_counter = 0
end

at_exit do
  if ENV['SCREENSHOT'] == "all" || ENV['SCREENSHOT'] == "true"
    if ENV['TITLE']
      html_file = open("#{ENV['TITLE']}-screenshots.html", 'w')
    else
      html_file = open("screenshots.html", 'w')
    end
    html_file.write "<html><head>"
    html_file.write "<style type=\"text/css\">"
    html_file.write "P.breakhere {page-break-before: always}"
    html_file.write "</style>"
    html_file.write "</head>"
    html_file.write "<h1 style=\"text-align:center;\"> #{ENV['TITLE']} - #{current_date}</h1>" if ENV['TITLE']
    html_file.write "<h1> CVT Date: #{current_date}</h1>"
    html_file.write "<h1> CVT Environment: #{environment}</h1>"
    html_file.write "<h1> CVT Login URL: #{login}</h1>"
    #html_file.write "<img src=\"logo.png\" border=\"0\">"
    html_file.write "<P class=\"breakhere\">"

    Dir.glob("#{current_path}*png").sort.each { |screenshot|
      screenshot_name="#{screenshot}".downcase.tr!("_", " ")
      screenshot_name.sub! "#{current_path}", ""
      screenshot_name.sub! ".png", ""
      html_file.write "<h2> #{screenshot_name} </h2><br/>"
      html_file.write "<img src=\"#{screenshot}\" border=\"0\">"
      html_file.write "<P class=\"breakhere\">"
    }
  end
end

def environment
  environment = "#{ENV['E2E']}"
  case environment
    when 'paas-prod'
      "PaaS Prod"
    when "ppps"
      "Paas Pre-Production"
    when "prod"
      "Production"
    when "prep"
      "Pre-Production"
    else
      "E2E08"
  end
end

  def selfservice
  environment = "#{ENV['E2E']}"
  case environment
    when "prod"
      "http://myaccount.myvodafone.com.au"
    when "ppps"
      "http://selfservice-preprod-2.myaccount.services.vodafone.com.au"
  end

  end

  def subscriptions
    environment = "#{ENV['E2E']}"
    case environment
      when 'paas-prod'
        "https://selfservice-prod-1.myaccount.services.vodafone.com.au"
      when "ppps"
        "https://selfservice-preprod-2.myaccount.services.vodafone.com.au"
      when "prod"
        "https://subscriptions.services.vodafone.com.au/logins/new"
      when "prep"
        "https://subscriptions-portal.preprod.paas.services.vodafone.com.au/logins/new"
    end
  end

  def dealer
    environment = "#{ENV['E2E']}"
    case environment
      when "prod"
        "https://dealer-activation.services.vodafone.com.au/dealers/sign_in"
      when "prod2"
        "https://dealer-activation.prod2.paas.services.vodafone.com.au/dealers/sign_in"
      else "prep"
      "https://dealer-activation-preprod.services.vodafone.com.au/dealers/sign_in"
    end
  end

  def login
    application = "#{ENV['APP']}"
      case application
      when"Selfservice"
        selfservice
      when "Subscriptions"
        subscriptions
      when "Dealer"
        dealer
    end
  end

def current_date
  return "#{Time.new.day}-#{Time.new.month}-#{Time.new.year}"
end


