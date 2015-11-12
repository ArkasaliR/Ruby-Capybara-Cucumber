@prepaid_options
Feature: As a prepay Vodafone MyAccount user I want an area where I can easily find all my prepaid options in one area so that I don't have to call a CSR for help.
  As a prepay customer
  I want to log in to My Vodafone
  So I can access all my prepaid options links

Scenario: Customers can view prepay options links
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "prepay_voice" 
  And I navigate to the Prepaid Options page
  Then I should see the prepaid options links
  And I logout
