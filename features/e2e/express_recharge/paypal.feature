@paypal
Feature: Payment using new credit card
  As a prepaid customer
  I want to be able to recharge with credit card
  so that I can add credit to my account

#New credit card for prepay and MBB user
  Scenario: Prepay user be able to view links and PayPal option
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_voice" and the CC accordion is close
    When I select pay with CC
    Then I should see pay with new Credit card option
    And I open PayPal accordion
    And I should see pay with PayPal option 

  Scenario: MBB user be able to view links and PayPal option
    Given an express recharge for unauthenticated msisdn "prepay_mbb" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_mbb" and the CC accordion is close
    When I select pay with CC
    Then I should see pay with new Credit card option
    And I open PayPal accordion
    And I should see pay with PayPal option 

#Saved credit card for Prepay and MBB
  Scenario: Prepay user will be prompted to pay with registered CC
    Given an express recharge for unauthenticated msisdn "prepay_voice_CC" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_voice_CC" and the CC accordion is open
    And I should be able to pay with saved Credit card details
    And I open PayPal accordion
    And I should see pay with PayPal option 

#confirmation page
  Scenario: Prepay without CC: user gets paypal confirmation page with all details
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_voice" and the CC accordion is close
    When I choose the following recharge options
      | Recharge option | Recharge amount |
      | 365 Day         | $20             |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_voice"
      | Recharge product | Recharge amount |
      | 365 Day          | $20             |
    When I login with existing PayPal account
    And I confirm the PayPal transaction
    Then I should see the following PayPal recharge summary for msisdn "prepay_voice"
      | Recharge product | Recharge amount |
      | 365 Day          | $20             |
    And I should see the link to My Vodafone
    And I should see the link to Recharge Other

  
  Scenario: Prepay with CC: Users gets redirected to My Vodafone after paypal recharge
    Given an express recharge for unauthenticated msisdn "prepay_voice_CC" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_voice_CC" and the CC accordion is open
    When I choose the following recharge options
      | Recharge category | Recharge amount        |
      | Add-ons & Extras  | $5 Internet Essentials |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_voice_CC"
      | Recharge product | Recharge amount |
      | Add-ons & Extras | $5              |
    When I login with existing PayPal account
    And I confirm the PayPal transaction
    Then I should see the following PayPal recharge summary for msisdn "prepay_voice_CC"
      | Recharge product | Recharge amount |
      | Add-ons & Extras | $5              |
    And I should see the link to My Vodafone
    And I should see the link to Recharge Other
    When I navigate to My Vodafone page
    Then I should see My Vodafone Login page

@test
  Scenario: MBB without CC: user gets redirected to Recharge other after successful processing of paypal recharge
    Given an express recharge for unauthenticated msisdn "prepay_mbb" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_mbb" and the CC accordion is close
    When I choose the following recharge options
      | Recharge amount     |
      | $20 1.1GB (30 Days) |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_mbb"
      | Recharge product | Recharge amount |
      | Prepaid MBB      | $20             |
    When I login with existing PayPal account
    And I confirm the PayPal transaction
    Then I should see the following PayPal recharge summary for msisdn "prepay_mbb"
      | Recharge product | Recharge amount |
      | Prepaid MBB      | $20             |
    And I should see the link to My Vodafone
    And I should see the link to Recharge Other
    When I navigate to Recharge Other page
    Then I should see the express recharge enter MSISDN page

#CC issue
  @wip
  Scenario: MBB with CC: user gets redirected to Recharge other after successful processing of paypal recharge
    Given an express recharge for unauthenticated msisdn "prepay_mbb_CC" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_mbb_CC" and the CC accordion is open
    When I choose the following recharge options
      | Recharge amount     |
      | $49 6.6GB (30 Days) |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_mbb_CC"
      | Recharge product | Recharge amount |
      | Prepaid MBB      | $49             |
    When I login with existing PayPal account
    And I confirm the PayPal transaction
    Then I should see the following PayPal recharge summary for msisdn "prepay_mbb_CC"
      | Recharge product | Recharge amount |
      | Prepaid MBB      | $49             |
    And I should see the link to My Vodafone
    And I should see the link to Recharge Other
    When I navigate to Recharge Other page
    Then I should see the express recharge enter MSISDN page

#cancel PayPal payment
  Scenario: Prepay user can cancel the paypal payment
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_voice" and the CC accordion is close
    When I choose the following recharge options
      | Recharge option | Recharge amount |
      | 365 Day         | $20             |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_voice"
      | Recharge product | Recharge amount |
      | 365 Day          | $20             |
    When I cancel the PayPal transaction
    Then I should be on the recharge page for msisdn "prepay_voice" and the CC accordion is close
    And I should see pay with PayPal option

  Scenario: MBB user can cancel the paypal payment
    Given an express recharge for unauthenticated msisdn "prepay_mbb" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_mbb" and the CC accordion is close
    When I choose the following recharge options
      | Recharge amount     |
      | $10 330MB (30 Days) |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_mbb"
      | Recharge product | Recharge amount |
      | Prepaid MBB      | $10             |
    When I login with existing PayPal account
    And I cancel the PayPal transaction
    Then I should be on the recharge page for msisdn "prepay_mbb" and the CC accordion is close
    And I should see pay with PayPal option

#cancel PayPal payment scenario 2
  Scenario: Prepay can not submit after cancelling first payment
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_voice" and the CC accordion is close
    When I choose the following recharge options
      | Recharge option | Recharge amount |
      | 365 Day         | $20             |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_voice"
      | Recharge product | Recharge amount |
      | 365 Day          | $20             |
    When I cancel the PayPal transaction
    Then I should be on the recharge page for msisdn "prepay_voice" and the CC accordion is close
    And I should see pay with PayPal option
    When I hit the browser back button
    And I login with existing PayPal account
    And I confirm the PayPal transaction
    Then I should see an internal server error title

  Scenario: MBB can not submit after cancelling first payment
    Given an express recharge for unauthenticated msisdn "prepay_mbb" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_mbb" and the CC accordion is close
    When I choose the following recharge options
      | Recharge amount     |
      | $10 330MB (30 Days) |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_mbb"
      | Recharge product | Recharge amount |
      | Prepaid MBB      | $10             |
    When I login with existing PayPal account
    And I cancel the PayPal transaction
    Then I should be on the recharge page for msisdn "prepay_mbb" and the CC accordion is close
    And I should see pay with PayPal option
    When I hit the browser back button
    And I login with existing PayPal account
    And I confirm the PayPal transaction
    Then I should see an internal server error title

#non-register user
  Scenario: Non-registered Prepay user without CC details is able to pay with paypal
    Given an express recharge for unauthenticated msisdn "prepay_non_register" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_non_register" and the CC accordion is close
    When I choose the following recharge options
      | Recharge option | Recharge amount |
      | 365 Day         | $20             |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_non_register"
      | Recharge product | Recharge amount |
      | 365 Day          | $20             |
    When I login with existing PayPal account
    And I confirm the PayPal transaction
    Then I should see the following PayPal recharge summary for msisdn "prepay_non_register"
      | Recharge product | Recharge amount |
      | 365 Day          | $20             |
    And I should see the link to My Vodafone
    And I should see the link to Recharge Other

#test data issue
@wip
  Scenario: Non-registered Prepay user with CC details is able to pay with paypal
    Given an express recharge for unauthenticated msisdn "prepay_non_register_CC" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_non_register_CC" and the CC accordion is close
    When I choose the following recharge options
      | Recharge option | Recharge amount |
      | 365 Day         | $20             |
    And I select pay with PayPal
    Then I should be redirected to the PayPal website with information for msisdn "prepay_non_register_CC"
      | Recharge product | Recharge amount |
      | 365 Day          | $20             |
    When I login with existing PayPal account
    And I confirm the PayPal transaction
    Then I should see the following PayPal recharge summary for msisdn "prepay_non_register_CC"
      | Recharge product | Recharge amount |
      | 365 Day          | $20             |
    And I should see the link to My Vodafone
    And I should see the link to Recharge Other

# no test data
@wip  
  Scenario: MBB user will be prompted to pay with saved credit card
    Given an express recharge for unauthenticated msisdn "prepay_mbb_CC" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_mbb_CC" and the CC accordion is open
    And I should be able to pay with saved Credit card details
    And I open PayPal accordion
    And I should see pay with PayPal option 

#no test data
@wip 
  Scenario: Prepay user must choose a recharge option
    Given an express recharge for unauthenticated msisdn "prepay_voice" is started on e2e
    Then I should be on the recharge page for msisdn "prepay_voice" and the CC accordion is close
    When I select pay with PayPal
    Then I should see error message to select a recharge option
    And I should see PayPal accordion is close
    When I choose the following recharge options
      | Recharge option |
      | 365 Day         |
    And I select pay with PayPal
    Then I should see error message to select a recharge amount
    And I should see PayPal accordion is close