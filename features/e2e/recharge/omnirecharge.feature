@omnirecharge
Feature: Omnirecharge
  As a prepaid customer
  I want to be able to see same recharge pricepoints across plans
  so that I can recharge with different plans of same price

  Scenario: Prepay user be able to see same recharge pricepoints across plans
    Given a recharge for authenticated msisdn "prepay_voice" is started on e2e
    When I choose to recharge with something else
    Given I select the commercial offer "Cap"  
    #Then I should see two same recharges under plans
    Given I select the price point of "30" with 1 GB data
    And I capture a screenshot
    And I click the I want this one button
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4564456445644564 | 1016 | 123 |
    And I check the accept T&C checkbox
    And I capture a screenshot
    And I logout

#@Omni_Data
  Scenario: Prepay user be able to see same Data Add-ons pricepoints across plans
    Given a recharge for authenticated msisdn "prepay_voice_omni" is started on e2e
    When I choose to Buy an add-on
    Given I select the commercial offer "Data Add-ons"
    Then I should see Data Add-ons carousel page with commercial offers
    #Then I should see two same recharges under plans
    # Given I select the price point of "15" with 2 GB data
    And I capture a screenshot
    And I click the I want this one button
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4564456445644564 | 1016 | 123 |
    And I check the accept T&C checkbox
    And I capture a screenshot
    And I logout