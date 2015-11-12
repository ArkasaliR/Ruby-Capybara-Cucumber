@NetworkSettings
Feature: View network settings
  As a customer
  I want to be able to view my network settings

  Background:
    * I open e2e WSS login page

  Scenario Outline: View and change network call settings
    Given I log in with a valid msisdn with "<msisdn_type>"
    And   I navigate to the Call & service settings page
    Then  I see the current status for "<network_call_setting>"
    When  I change the status for "<network_call_setting>"
    Then  I should see the PUK code displayed under Call&Service Settings
    And   I click on Save Settings button
    Then  I should see the changed status for "<network_call_setting>"
    And   I logout

  Examples:
    | msisdn_type    | network_call_setting  |
    | prepay_voice   | Allow call conference |
    | prepay_voice   | Show caller ID        |
    | prepay_mbb     | Allow call conference |
    | prepay_mbb     | Show caller ID        |
    | postpay_simple | Allow call conference |
    | postpay_simple | Show caller ID        |
    | postpay_complex| Allow call conference |
    | postpay_complex| Show caller ID        |
  
  Scenario Outline: View call barring status
    Given I log in with a valid msisdn with "<msisdn_type>"
    When I navigate to the Call & service settings page
    Then I should see call barring status as Inactive
    And I logout

    Examples:
    | msisdn_type    |
    | postpay_simple |
    | prepay_voice   |
    | prepay_mbb     |
    | postpay_complex|

  Scenario Outline: View outgoing call barring status
    Given I log in with a valid msisdn with "<msisdn_type>"
    When I navigate to the Call & service settings page
    Then I should see outgoing call barring status
    And I logout

    Examples:
    | msisdn_type                    |
    | postpay_complex_outgoingbarred |
    | prepay_voice_outgoingbarred    |
