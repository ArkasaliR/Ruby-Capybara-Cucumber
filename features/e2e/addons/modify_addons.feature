@addons
Feature: As a vodafone customer I should be able to modify addon
  As a postpay customer
  I should be able to modify purchased addons to my account

  Scenario: As a postpay customer I want to modify purchased addon
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_with_subscribed"
    And I navigate to the My addons page
    Then I should see my current purchased Data addon
    And I capture a screenshot
    And I select Change Data Add-on
    And I select the my "$ 5 /month 150MB" add-on to change
    And I capture a screenshot
    Then I should see Review addon page details
    And I capture a screenshot
    And I Agree to the terms and conditions
#   -- Following steps are hard to run on e2e --
#    And I follow "Confirm"
#    Then I am directed to Processing order details page
#    And I should see Processing order details
#    And I select Back to My Usage link
#    And  I am directed to My usage page
    And I logout

 @uat2
  Scenario: As a postpay customer I want to modify purchased IDD addon
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple_legacy"
    And I navigate to the My addons page
    And I will see the active International calls add on currently associated with my service
    And I select Change IDD Add-on
    And I capture a screenshot
    And I select the my "$ 15 /month 200 mins" add-on to change
    And I capture a screenshot
    Then I should see modify_addon "$15 200mins Talk International Add-on" review page details
    And I capture a screenshot
    And I Agree to the terms and conditions
    And I logout