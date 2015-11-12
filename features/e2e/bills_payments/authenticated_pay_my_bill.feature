@paybill
Feature: Authenticated pay my bill  
  As a postpay customer
  I should be able to pay mybill when i am loggedin
  so that I can use my service without getting blocked

  Scenario: As a postpay account holder I should be able to access paybill page
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I navigate to Bills & Payments Page
    When I make a payment
    Then I should see Bills & Payments page title
    And I hit the browser back button
    And I logout

  Scenario: As a postpay complex account holder I should see prod Bills and Payments page by entering PIN
    Given I open e2e WSS login page 
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit    
    Then I should see Bills & Payments page title
    And I logout

