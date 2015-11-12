@nav
Feature: Log in to My Vodafone
  As a customer
  I want to log in to My Vodafone
  So that I can navigate around the application

  #Scenario: As a prepay user I want to view more services
  #  Given I open e2e WSS login page
  # When I log in with a valid msisdn with "prepay_voice"
  #  Then I should see More Services link
  #  And I follow More Services link
  #  And I should see MSISDN string for "prepay_voice"
  #  And I open e2e WSS login page
  #  And I should see my "prepay_voice" plan name
  #  And I logout

  #Scenario: As a postpay simple user I want to view more services
  #  Given I open e2e WSS login page
  #  When I log in with a valid msisdn with "postpay_simple"
  #  Then I should see More Services link
  #  And I follow More Services link
  #  And I should see MSISDN string for "postpay_simple"
  #  And I open e2e WSS login page
  #  And I should see my "postpay_simple" plan name
  #  And I logout

  Scenario: As a postpay complex user I want to view more services
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    Then I should see More Services link
    And I follow More Services link
    And I should see MSISDN string for "postpay_complex"
    And I open e2e WSS login page
    And I should see my "postpay_complex" plan name
    And I logout
