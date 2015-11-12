@orpc
Feature: Add-on managment during rate plan change

Scenario: Change plan for a msisdn without add-ons
Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to the Account Settings page
    And I navigate to Change plan
    And I enter a valid pin and submit
    And I go to Compare other plans page from my Current Plan details page
    And I select a plan with plan id "AU11057"
    Then I come on the plan change summary page
    And I logout

Scenario: Remove existing add-ons during rate plan change
Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the Account Settings page
    And I navigate to Change plan
    Then I see my current addon "$ 30 /month 5GB" on my Current Plan details page
    And I go to Compare other plans page from my Current Plan details page
    And I select a plan with plan id "AU11044"
    And I "remove" all addons from my Current Add-ons page
    Then I come on the plan change summary page
    And I logout

Scenario: Keeping the add-ons during rate plan change
Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the Account Settings page
    And I navigate to Change plan
    Then I see my current addon "$ 30 /month 5GB" on my Current Plan details page
    And I go to Compare other plans page from my Current Plan details page
    And I select a plan with plan id "AU11053"
    And I "keep" all addons from my Current Add-ons page
    Then I can see the addon "Data Add-on $30 - 5GB" in the "New monthly costs" section of plan change
    And I logout 