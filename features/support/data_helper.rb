# Running the CVT requires some ENVironment variables to be set.
# E2E := prod/prep/e2e8
# DEPLOYMENT_NAME := uatm
module DataHelpers

  # Maps data to environment

  def login_url
    environment = "#{ENV['E2E']}"
    deployment_name = "#{ENV['DEPLOYMENT_NAME']}"
    case environment
      when 'paas-prod'
        "https://selfservice-prod-1.myaccount.services.vodafone.com.au"
      when "ppps"
        "https://selfservice-preprod-2.myaccount.services.vodafone.com.au"
      when "prod"
        "http://myaccount.myvodafone.com.au"
      when "prep"
        "http://myaccount-preprod.vodalabs.com.au"
      when "ppps1"
        "https://selfservice-preprod-1.myaccount.services.vodafone.com.au"  
      else
        "http://#{deployment_name}.tst.ss.vodalabs.com.au"    #npe environments
    end
  end

  # TODO this won't work across all deployments
  def logout_url
    deployment_name = "#{ENV['DEPLOYMENT_NAME']}"
    "http://172.22.191.24:8080/auth/logout?url=https%3A%2F%2F#{deployment_name}.tst.ss.vodalabs.com.au%2Fsignout"
  end

  def subscriptions_url
    environment = "#{ENV['E2E']}"
    deployment_name = "#{ENV['DEPLOYMENT_NAME']}"
    case environment
      when "prod"
        "https://subscriptions.services.vodafone.com.au/logins/new"
      when "prep"
        "https://subscriptions-portal.preprod.paas.services.vodafone.com.au/logins/new"
      else
        "http://subscriptions-portal-#{deployment_name}.test.paas.vodalabs.com.au/logins/new"
    end
  end

  def recharge_url
      recharge = login_url
      recharge = "#{recharge}/recharge/new"
      return recharge
  end

  def paybill_url
      paybill = login_url
      paybill = "#{paybill}/bill_payments/new"
      return paybill
  end

  def activate_url
    environment = "#{ENV['E2E']}"
    case environment
      when "prod"
        "https://activate.services.vodafone.com.au/"
      else "prep"
        "https://activate-preprod.services.vodafone.com.au/"
    end
  end

  def formatted_msisdn_string (msisdn_type)
    msisdn = find_msisdn_info(msisdn_type,'msisdn')
    msisdn.sub! "61", "0"
    msisdn.insert 7, " "
    msisdn.insert 4, " "
    return msisdn
  end

  def formatted_paypal_msisdn_string(msisdn_type)
    msisdn = find_msisdn_info(msisdn_type, 'msisdn')
    msisdn.gsub(/^\+?614/, '')
  end

  def msisdn_string (msisdn_type)
    msisdn = find_msisdn_info(msisdn_type,'msisdn')
    msisdn.sub! "61", "0"
    return msisdn
  end

  def find_msisdn_info (msisdn_type,msisdn_info)
    "#{I18n.t "#{env_type}.#{msisdn_type}.#{msisdn_info}"}"
  end

  def password
    "#{I18n.t "#{env_type}.password"}"
  end

  def pin
    "#{I18n.t "#{env_type}.pin"}"
  end

  def env_type
    base_environment = "#{ENV['E2E']}"
    ['prep', 'ppps1', 'ppps', 'paas-prod'].include?(base_environment) ? 'prod' : base_environment
  end

  def paypal_id
    "#{I18n.t 'paypal.login.id'}"
  end

  def paypal_password
    "#{I18n.t 'paypal.login.password'}"
  end

end

 def data_usage_deeplink_url
      data_usage = login_url
      data_usage = "#{data_usage}/data_usage"
      return data_usage
  end

  def manage_addons_deeplink_url
      manage_addons = login_url
      manage_addons = "#{manage_addons}/addons/data"
      return manage_addons
  end

  def dealer_url
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

 def pli_params_present?
     ENV['PLI_KEY'] && ENV['PLI_IV']
  end

 def pli_login_url(pli)
      "#{login_url}/home?pli=#{pli}"
 end

World(DataHelpers)
