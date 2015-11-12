@login
Feature: Log in to My Vodafone
  As a customer
  I want to log in to My Vodafone
  So that I can manage my account
  
  Scenario: Successful log in for prepay customer
    Given I open e2e WSS login page 
    When I log in with a valid msisdn with "prepay_voice"
    Then I should see "prepay_voice" as my service number
    And I logout

  #Authentication dialog focus and typing for PREP is not implemented already
  Scenario: Successful log in for postpay simple customer  
    Given I open e2e WSS login page
    #When I confirm authentication dialog
    When I log in with a valid msisdn with "postpay_simple"
    Then I should see "postpay_simple" as my service number
    And I logout

  Scenario: Successful log in for postpay complex customer
    Given I open e2e WSS login page 
    When I log in with a valid msisdn with "postpay_complex"
    Then I should see "postpay_complex" as my service number
    And I logout
 
  Scenario: As a postpay complex account holder I should see prod Bills and Payments page by entering PIN
    Given I open e2e WSS login page 
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit    
    Then I should see page title as "Bills & Payments"    
    And I logout

  @wip
  Scenario: Successful log in for '04' number  
    Given I open e2e WSS login page
    When I log in with a 04 msisdn with "postpay_simple"
    Then I should see "postpay_simple" as my service number
    And I logout

  Scenario: Successfuly able to login again after logout using a login again link
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I should see "postpay_simple" as my service number
    And I logout
    Then I click to login again link