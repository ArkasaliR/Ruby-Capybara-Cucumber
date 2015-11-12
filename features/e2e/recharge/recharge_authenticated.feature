@recharge
Feature: Payment using new credit card
  As a prepaid customer
  I want to be able to recharge with credit card
  so that I can add credit to my account

  Scenario: Prepay user be able to view links and navigate to T&Cs page
    Given a recharge for authenticated msisdn "prepay_voice" is started on e2e
    And I visit the T&Cs page
    And I move back from the T&Cs page
    And I should see link Critical Information
    And I should see a link to recharge option details
    And I logout

  Scenario: MBB user view links and verify the link to voucher recharge
    Given a recharge for authenticated msisdn "prepay_mbb" is started on e2e
    And I should see link Voucher recharge
    And I should see link Critical Information
    And I should see a link to recharge option details
    And I logout

  @uat
  Scenario: MBB user with new CC be able to recharge 
    Given a recharge for authenticated msisdn "prepay_mbb" is started on e2e
    When I choose the same recharge
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4564809999999992 | 1016 | 123 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation
    And I logout

  @uat
  Scenario: User with new CC be able to change his plan and recharge 
    Given a recharge for authenticated msisdn "prepay_registered" is started on e2e
    When I click change logged in plan button
    And I change logged in plan with the following
    | Plan Name | Price |
    | Cap | $40 Cap |
    And I click use new CC button
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4564809999999992 | 1016 | 123 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation
    And I navigate to My Usage page
    Then I should see my "Cap" plan name
    And I logout


  @prepaid2014
  Scenario: User is able to recharge with the previous recharge details
    Given a recharge for authenticated msisdn "prepay_registered" is started on e2e
    Then I should get my last recharge details
    When I choose to use the same recharge
    Then I should see my last recharge details
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 5100100100100102  | 1016 | 123 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation
    And I navigate to My Usage page
    Then I should see my last recharge details
    And I logout

    @prepaid2014
    Scenario: User should be able to switch plans and recharge
    Given a recharge for authenticated msisdn "prepay_registered" is started on e2e
    When I choose recharge with voucher big button
    When I enter a recharge voucher pin "990035028562" and submit
    Then I should see voucher carousel page with commercial offers
    And I logout

    @prepaid2014
    Scenario: User should be able to switch plans and recharge
    Given a recharge for authenticated msisdn "prepay_mbb" is started on e2e
     When I choose recharge with voucher big button
    When I enter a recharge voucher pin "990035028562" and submit
    Then I should see mbb voucher carousel page
    And I logout


  @prepaid2014
  Scenario: User should be able to switch plans and recharge
    Given a recharge for authenticated msisdn "prepay_registered" is started on e2e
    Then I should get my last recharge details
    When I choose to recharge with something else
    Given I select the commercial offer "FlexiCap"
    Given I select the price point of "$29"
    And I click the I want this one button
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4564456445644564 | 1016 | 123 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation
    And I navigate to My Usage page
    And I logout


 
 @prepaid2014
  Scenario: User is able to recharge with the previous recharge details
    Given a recharge for authenticated msisdn "prepay_mbb" is started on e2e
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
    And I navigate to My Usage page
    Then I should see my last recharge details
    And I logout


  @prepaid2014
  Scenario: User should be able to switch plans and recharge
    Given a recharge for authenticated msisdn "prepay_mbb" is started on e2e
    Then I should get my last recharge details
    When I choose to recharge with something else
    Given I select the commercial offer "Prepaid MBB"
    Given I select the mbb price point of "$60"
    And I click the I want this one button
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
    | Name On Card | Card No | Expiry | CCV |
    | testc approve | 4564809999999992 | 1016 | 123 |
    And I check the accept T&C checkbox
    And I submit recharge with new CC details
    Then I should see Payment Confirmation
    And I navigate to My Usage page
    And I logout

    
  @uat
  Scenario: User with registered CC be able to change his plan and recharge 
    Given a recharge for authenticated msisdn "prepay_registered" is started on e2e
    When I click change logged in plan button
    And I change logged in plan with the following
    | Plan Name | Price |
    | TXT & Talk | $70 |
    When I provide recharge with registered CC details for "prepay_registered"
    And I submit recharge with registered CC details
    Then I should see Payment Confirmation
    And I navigate to My Usage page
    Then I should see my "TXT & Talk" plan name
    And I logout

  @uat
  Scenario: User with registered CC be able to revert to the original plan and recharge 
    Given a recharge for authenticated msisdn "prepay_registered" is started on e2e
    When I click change logged in plan button
    And I change to original logged in plan for "prepay_registered"
    When I provide recharge with registered CC details for "prepay_registered"
    And I submit recharge with registered CC details
    Then I should see Payment Confirmation
    And I navigate to My Usage page
    And I should see my "prepay_registered" plan name
    And I logout