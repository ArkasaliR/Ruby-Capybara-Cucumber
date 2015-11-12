@orpc
Feature: Compare my Plan to selected plan 

Scenario: I can see details of current and selected plan on compare and go back to plan selection
Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the Account Settings page
    And I navigate to Change plan
    And I go to Compare other plans page from my Current Plan details page
    And I compare my plan with plan id "AU11094" and "cancel" it
    Then I should see Compare plans page
    And I logout

Scenario: I can see details of current and selected plans on compare and choose to change to this plan
Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the Account Settings page
    And I navigate to Change plan
    And I go to Compare other plans page from my Current Plan details page
    And I compare my plan with plan id "AU11094" and "choose" it
    And I "keep" all addons from my Current Add-ons page 
    Then I come on the plan change summary page
    And I logout

@cvt
@plansrefreshorpc
Scenario: I can see details of current legacy plan and selected new plan on compare and choose to change to new plan
Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the Account Settings page
    And I navigate to Change plan
    And I go to Compare other plans page from my Current Plan details page
    And I compare my plan with plan id "AU11184" and "choose" it
    And I "keep" all addons from my Current Add-ons page 
    Then I come on the plan change summary page
    And I logout
    
