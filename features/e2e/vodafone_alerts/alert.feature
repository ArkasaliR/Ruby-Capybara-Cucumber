@alerts
Feature: View alert status
  As a customer
  I login into my vodafone
  So that i know my alert status

  Scenario: As a simple customer I want to change my vodafone alert
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    Then I should see information on Vodafone Alerts
    When I navigate to the Vodafone Alerts page from the My usage page
    Then I should see my Alerts settings status
    And I change my Vodafone Alerts settings
    And I logout

  Scenario: As a complex customer I want to change my vodafone alert
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I click change button
    And I enter a valid pin and submit
    Then I should see information on Vodafone Alerts
    When I navigate to the Vodafone Alerts page from the My usage page
    Then I should see my Alerts settings status
    Then I change my Vodafone Alerts settings
    And I should have the option to select a different service on my account
    And I logout

  Scenario: As a prepay customer I should not be able to see vodafone alert information
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "prepay_voice"
    Then I should see "prepay_voice" as my service number
    Then I should not see any reference to Vodafone Alerts on my usage page
    And I logout
