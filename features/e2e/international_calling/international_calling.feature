  @idd
  Feature: As a vodafone customer I should be able to see my international calling status
  As a postpay and prepay customer
  I want to log in to My Vodafone
  So that I can view my international calling status

  Scenario: Logged in prepay user and navigate to international calling page to update status
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "prepay_voice" 
    And I navigate to the International Calling page
    Then I should see my International Calling settings status
    And I change my International Calling settings
    And I should not have the option to select a different service on my account    
    And I save the International Calling settings
    And I am informed that the International Calling settings are being updated
    And I navigate to the International Calling page
    And I should see my International Calling settings status
    And I logout

  Scenario: Logged in prepay user and navigate to international calling page to follow further info page
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "prepay_voice" 
    And I navigate to the International Calling page
    And I should be able to follow information on calling rates 
    And I logout
 
  Scenario: Logged in postpay simple user and navigate to to international calling page to update status 
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple" 
    And I navigate to the International Calling page
    Then I should see my International Calling settings status
    Then I change my International Calling settings
    And I should not have the option to select a different service on my account
    And I logout
 
  Scenario: Logged in postpay complex user and navigate to to international calling page to update status 
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to the International Calling page
    And I enter a valid pin and submit
    Then I should see my International Calling settings status
    And I change my International Calling settings
    And I should have the option to select a different service on my account
    And I logout 