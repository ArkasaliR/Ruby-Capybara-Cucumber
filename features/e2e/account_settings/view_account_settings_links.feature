@account_settings
Feature: As a Vodafone MyAccount user I want an area where I can easily find all my account settings in one area so that I don't have to call a CSR for help.
  As a vodafone customer
  I want to log in to My Vodafone
  So I can access all my account settings links

Scenario: Customers can view prepay account settings links
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "prepay_voice" 
  And I navigate to the Account Settings page
  Then I should see the prepay account settings links
  And I logout

Scenario: Customers can view postpay account settings links
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "postpay_simple" 
  And I navigate to the Account Settings page
  Then I should see the postpay account settings links
  And I logout