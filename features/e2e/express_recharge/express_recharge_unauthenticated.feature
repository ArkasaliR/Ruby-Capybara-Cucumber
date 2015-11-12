@express
Feature: Payment using new credit card
  As a prepaid customer
  I want to be able to recharge with an unsaved credit card
  so that I can add credit to my account

  Scenario: User able to change MSISDN on credit card page
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    And I change the phone number I want to recharge
    Then I should see message Recharge this number

  Scenario: Prepay user be able to view links and navigate to T&Cs page
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    And I visit the T&Cs page
    And I move back from the T&Cs page
    And I should see link Critical Information
    And I should see a link to recharge option details

  Scenario: Verify account not found error message
    Given an express recharge for unauthenticated invalid msisdn is started on e2e
    Then I should see an error message saying my MSISDN was not found


   @prepaid2014
   Scenario: User should be able to do an express recharge using voucher
   Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
   And I select recharge using voucher
   When I enter a recharge voucher pin "990035028562" and submit
   Then I should see voucher carousel page with commercial offers


  @prepaid2014
  Scenario: User is able to express recharge with the previous recharge details
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    And I select recharge using credit card
    Then I should get my last recharge details
    When I choose to use the same recharge
    Then I should see my last recharge details
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4564809999999992 | 1016 | 123 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation
    

  @prepaid2014
  Scenario: User should be able to switch plans and recharge using express recharge
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    And I select recharge using credit card
    Then I should get my last recharge details
    When I choose to recharge with something else
    Given I select the commercial offer "FlexiCap"
    Given I select the price point of "$29"
    And I click the I want this one button
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 376000000000006 | 1016 | 1234 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation


   @prepaid20141
   Scenario: User should be able to do an express recharge using voucher
   Given an express recharge for unauthenticated msisdn "prepay_mbb" is started on e2e
   And I select recharge using voucher
   When I enter a recharge voucher pin "090000800100" and submit
   Then I should see mbb voucher carousel page


  @prepaid2014
  Scenario: User is able to express recharge with the previous recharge details
    Given an express recharge for unauthenticated msisdn "prepay_mbb" is started on e2e
    And I select recharge using credit card
    Then I should get my last recharge details
    When I choose to use the same recharge
    Then I should see my last recharge details
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 376000000000006 | 1016 | 1234 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation
    

  @prepaid2014
  Scenario: User should be able to switch plans and recharge using express recharge
    Given an express recharge for unauthenticated msisdn "prepay_mbb" is started on e2e
    And I select recharge using credit card
    Then I should get my last recharge details
    When I choose to recharge with something else
    #Given I select the commercial offer "FlexiCap"
    Given I select the price point of "$30"
    And I click the I want this one button
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4001001001001006   | 1016 | 123 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation


  @expressaddon
  Scenario: User is able to express recharge an addon
    Given an express recharge for unauthenticated msisdn "prepay_addon" is started on e2e
    And I select recharge using credit card
    Then I should get my last recharge details
    When I choose to recharge an addon
    Then I should see addon carousel page
    Given I select the price point of "$5"
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4001001001001006  | 1016 | 123 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation

