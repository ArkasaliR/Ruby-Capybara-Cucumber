@accounts
Feature: Log in to My Vodafone
  As a customer
  I want to log in to My Vodafone
  So that I can view my account summary

  Scenario: As a postpay user I want to view my account summary information 
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    Then I should see "postpay_simple" as my service number
    And I should see my "postpay_simple" plan name
    And I logout

  Scenario: As a postpay complex account holder I want to see my billing account number
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to my account from My Usage
    And I enter a valid pin and submit
    Then I should see "postpay_complex" as my account number
    And I logout

  Scenario: As a postpay complex account holder I want to be on usage page if I follow link on accounts page
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to my account from My Usage
    And I enter a valid pin and submit
    And I follow view "postpay_complex"
    And I logout

  Scenario: Viewing bills and payments summary for a complex user shows account name and number
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit
    Then I should see "postpay_complex" as my account name 
    Then I should see "postpay_complex" as my account number 
    Then I should see Bills & Payments page title
    And I logout

  Scenario: Viewing bills and payments summary for a simple user shows account name and number
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I navigate to Bills & Payments Page
    Then I should see "postpay_simple" as my account name
    Then I should see "postpay_simple" as my account number 
    Then I should see Bills & Payments page title
    And I logout

  Scenario: As a postpay simple account holder I should see Extra Charges information
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    Then I should see Extra Usage information
    And I logout

  Scenario: As a postpay complex account holder I should see Extra Charges information on the account page
    Given I open e2e WSS login page    
    When I log in with a valid msisdn with "postpay_complex"
    And I click change button
    And I enter a valid pin and submit
    Then I should see Extra Usage information
    And I logout

  Scenario: As a postpay customer I want to pay my bill by credit card regardless being logged in using my mobile service number
    Given I open pay my bill non loggedin page
    When I send a payment for msisdn "postpay_simple"
    Then I should be reviewing the pay bill information

  Scenario: As a postpay customer I want to pay my bill by credit card regardless being logged in using my BAN
    Given I open pay my bill non loggedin page
    When I send a payment for ban "postpay_simple"
    Then I should be reviewing the pay bill information
 
  Scenario: As a postpay customer I can see a validation message when entering wrong msisdn or BAN in pay my bill not logged in page
    Given I open pay my bill non loggedin page
    When I send a payment for "12345678"
    Then I should see an error message saying that the given number is neither a msisdn nor a BAN
    When I send a payment for "123456789012"
    Then I should see an error message saying that the given number is neither a msisdn nor a BAN 