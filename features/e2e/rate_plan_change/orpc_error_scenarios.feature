@orpc
Feature: Error handling in ORPC

Scenario:User Cannot Change plan without accepting  
Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to the Account Settings page
    And I navigate to Change plan
    And I enter a valid pin and submit
    And I go to Compare other plans page from my Current Plan details page
    And I select a plan with plan id "AU11057"
    Then I come on the plan change summary page
    And I change to new plan
    Then I see an error message on the plan change summary page
    And I logout

Scenario: Change plan journey for complex customer
Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to the Account Settings page
    And I navigate to Change plan
    And I enter a valid pin and submit
    And I go to Compare other plans page from my Current Plan details page
    And I select a plan with plan id "AU11058"
    And I come on the plan change summary page
    And I change the msisdn service to "0405 092 142"
    Then I should see current Plan details on the page
    And I logout