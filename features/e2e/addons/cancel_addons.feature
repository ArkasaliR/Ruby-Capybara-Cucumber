@addons
Feature: Cancel addons
  As a postpay customer
  I should be able to cancel an addon

  Scenario: As a postpay customer I want to cancel a purchased addon
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_with_subscribed"
    And I navigate to the My addons page
    And I select Change Data Add-on
    And I select Remove addon link
    And I capture a screenshot
    Then I should see Remove add-on page details
#   -- Following steps are hard to run on e2e --
#    And I follow "Confirm"
#    And I am directed to Processing order details page
#    And I should see Processing order details
#    And I select Back to My Usage link
#    And I am directed to My usage page
    And I logout

  Scenario: As a complex postpay customer I want to cancel a purchased IDD addon
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_complex_with_subscribed"
    And I navigate to the My addons page
    And I enter a valid pin and submit
    And I should see My Add-ons page title
    And I select Change IDD Add-on
    And I capture a screenshot
    And I select Remove addon link
    Then I should see Remove add-on page details
    And I capture a screenshot
    And I follow "Cancel"
    And I should see Monthly idd addons
    And I follow Cancel from Idd addons page
    And I am directed to My addons page
    And I logout
