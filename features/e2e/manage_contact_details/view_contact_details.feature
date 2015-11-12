@mad
Feature: View contact details
  As a postpaid user
  I want to be able to view my contact details

  Scenario: Prepaid customers should not see manage account details
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "prepay_voice"
    And I should not see a menu item for Contact Details
    And I logout