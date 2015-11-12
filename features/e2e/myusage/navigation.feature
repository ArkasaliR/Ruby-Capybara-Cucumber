@usage
Feature: My usage links
  As a customer
  I want to navigate to my usage

  Scenario: As a prepay user I want to view my usage
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "prepay_voice"
    Then I should see View Usage Details link
    When I follow View Usage Details link
    Then I should see my usage page
    * I logout

  Scenario: As a postpay user I want to view my usage
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_usage"
    Then I should see View Usage Details link
    When I follow View Usage Details link
    Then I should see my usage page
    * I logout

  @data_usage
  Scenario: As a postpay user I want to view data usage
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_usage"
    Then I should see Data Usage link
    When I follow Data Usage link
    Then I should see data usage page
    * I logout
