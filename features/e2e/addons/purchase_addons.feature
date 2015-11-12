@addons
Feature: As a vodafone customer I should be able to purchase addon
  As a postpay customer
  I should be able to purchase eligible addons to my account


  Scenario: As a postpay customer I want to purchase addon
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    And I select Add Data
    #And I select a Data add-on to purchase
    And I select the my "$ 5 /month 150MB" add-on to purchase
    And I capture a screenshot
    Then I should see Review addon page details
    And I capture a screenshot
    And I Agree to the terms and conditions
#   -- Following steps are hard to run on e2e --
#    And I follow "Confirm"
#    Then I am directed to Processing order details page
#    And I should see Processing order details
#    And I select Back to My Usage link
#    And I am directed to My usage page
    And I logout


@uat2
  Scenario: As a Non-legacy postpay customer I want to purchase data addon
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple_non_legacy"
    And I navigate to the My addons page
    And I select Add Data
    And I capture a screenshot
    And I select the my "$ 5 /month 400MB" add-on to purchase
    Then I should see Review "$5 400MB Data Add-on Month to Month" addon page details
    And I capture a screenshot
    And I Agree to the terms and conditions
    And I logout

  Scenario: As a postpay customer I want to purchase data booster
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    And I select Add Data
    And I click to view Data boosters
    And I capture a screenshot
    #And I select a Data booster to purchase
    And I select the my "$ 20 /one-off 1.25GB" booster to purchase
    And I capture a screenshot
    Then I should see Review addon page details
    And I capture a screenshot
    And I Agree to the terms and conditions
    And I logout

@uat2
  Scenario: As a postpay non-legacy customer I want to purchase talk and TXT booster
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple_non_legacy"
    And I navigate to the My addons page
    And I select Add Talk and TXT
    And I capture a screenshot
    And I select the my "$ 5 /one-off $25 value for Calls and TXT" booster to purchase
    Then I should see Review "$5 Talk & TXT Booster" addon page details
    And I capture a screenshot
    And I Agree to the terms and conditions
    And I logout

  Scenario: As a postpay customer I want to purchase talk and TXT booster
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    And I select Add Talk and TXT
    And I select the my "$ 15 /one-off $90 value for Calls and TXT" booster to purchase
    Then I should see Review "$15 Talk & TXT Booster" addon page details
    And I Agree to the terms and conditions
    And I logout


@uat2
  Scenario: As a Non-legacy postpay customer I want to purchase IDD addon
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple_non_legacy"
    And I navigate to the My addons page
    And I capture a screenshot
    And I select Add International calls
    And I select the my "$ 15 /month 200 mins" add-on to purchase
    And I capture a screenshot
    Then I should see Review "$15 200 mins Talk International Add-on" addon page details
    And I capture a screenshot
    And I Agree to the terms and conditions
    And I logout