Feature: Submit a proof of purchase request
  As a customer
  I want to be able to submit a proof of purchase request

  Scenario: Postpay simple user should be able to submit a proof of purchase request
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I navigate to the Account Settings page
    And I navigate to Proof of purchase page
    Then I should see Proof of purchase as my page title
    Then I fill the form to request proof of purchase with the following
      | Your name     | Email                            | Handset model   | Reason             | IMEI               | Purchased from |
      | Jimmy Johnson | online_form_test@vodafone.com.au | Iphone 5S       | Repair purposes    | 123456789101112    | Online         |
    And I capture a screenshot
    And I submit proof of purchase request
    Then I should see proof of purchase confirmation page
    And I capture a screenshot
    And I logout

  Scenario: Prepay user should be able to submit a proof of purchase request
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "prepay_voice"
    And I navigate to the Account Settings page
    And I navigate to Proof of purchase page
    Then I should see Proof of purchase as my page title
    Then I fill the form to request proof of purchase with the following
      | Your name     | Email                            | Handset model   | Reason             | IMEI               | Purchased from |
      | Jimmy Johnson | online_form_test@vodafone.com.au | Iphone 5S       | Repair purposes    | 123456789101112    | Online         |
    And I capture a screenshot
    And I submit proof of purchase request
    Then I should see proof of purchase confirmation page
    And I capture a screenshot
    And I logout

   Scenario: Postpay complex user should be able to submit a proof of purchase request
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to the Account Settings page
    And I navigate to Proof of purchase page
    And I enter a valid pin and submit
    Then I should see Proof of purchase as my page title
    Then I fill the form to request proof of purchase with the following
      | Your name     | Email                            | Handset model   | Reason             | IMEI               | Purchased from |
      | Jimmy Johnson | online_form_test@vodafone.com.au | Iphone 5S       | Repair purposes    | 123456789101112    | Online         |
    And I select secondary number
    And I capture a screenshot
    And I submit proof of purchase request
    Then I should see proof of purchase confirmation page
    And I capture a screenshot
    And I logout