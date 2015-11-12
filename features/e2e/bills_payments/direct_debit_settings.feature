@directdebit
Feature:  As a customer
  I want to see my direct debit details

  Scenario: I should be able to setup the Direct Debit and update the Direct Debit details from bank account
    to Credit card and cancel the Direct Debit option for the postpay simple customer
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I navigate to Bills & Payments Page
    And I cancel if direct debit setup is done
    Then I should see a link to setup direct debit
    And I click Setup Direct Debit button
    And I select the Bank Account option for Direct Debit
    And I enter the bank account details with the following
      | BSB | Account Name | Account Number |
      | 032067 | Test | 10235242 |
    And I submit the request
    Then I should see the Done success message
    And I navigate to Bills & Payments Page
    Then I should see a link to manage direct debit
    And  I validate make a payment button visibility
    And I click Manage Direct Debit button
    Then I should see my bank account details with the following
      | BSB    | Account Name | Account Number |
      | 032067 |    Test      | XXXXX242       |
    And I click Update Details button
    And I select the Credit Card option for Direct Debit
    And I enter the credit card details with the following
      | Name on card | Card number      | Expiry date | CCV |
      | Test         | 4111111111111111 |    1020     | 123 |
    Then I submit the request
    And I navigate to Bills & Payments Page
    And I click Manage Direct Debit button
    And I should see my credit card details with the following
      | Name on card | Card number      | Expiry date |
      | Test         | XXXXXXXXXXXX1111 | 10/2020     |
    Then I should see a link to Cancel Direct debit
    And I click Cancel Direct Debit button
    Then I should see cancel direct debit confirmation message
    And I click Cancel Direct Debit button
    Then I should see the Done success message
    And I should see successful direct debit cancellation message
    And I logout

  Scenario: I should be able to setup the Direct Debit and update the Direct Debit details from bank account
  to Credit card and cancel the Direct Debit option for the postpay complex customer
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit
    And I cancel if direct debit setup is done
    Then I should see a link to setup direct debit
    And I click Setup Direct Debit button
    And I select the Bank Account option for Direct Debit
    And I enter the bank account details with the following
      | BSB | Account Name | Account Number |
      | 032067 | Test | 10235242 |
    And I submit the request
    Then I should see the Done success message
    And I navigate to Bills & Payments Page
    Then I should see a link to manage direct debit
    And  I validate make a payment button visibility
    And I click Manage Direct Debit button
    Then I should see my bank account details with the following
      | BSB    | Account Name | Account Number |
      | 032067 |    Test      | XXXXX242       |
    And I click Update Details button
    And I select the Credit Card option for Direct Debit
    And I enter the credit card details with the following
      | Name on card | Card number      | Expiry date | CCV |
      | Test         | 4111111111111111 |    1020     | 123 |
    Then I submit the request
    And I navigate to Bills & Payments Page
    And I click Manage Direct Debit button
    And I should see my credit card details with the following
      | Name on card | Card number      | Expiry date |
      | Test         | XXXXXXXXXXXX1111 | 10/2020     |
    Then I should see a link to Cancel Direct debit
    And I click Cancel Direct Debit button
    Then I should see cancel direct debit confirmation message
    And I click Cancel Direct Debit button
    Then I should see the Done success message
    And I should see successful direct debit cancellation message
    And I logout

  Scenario: Postpay account dismisses and accepts popup when leaving the direct debit bank account setup
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit
    Then I should see a link to setup direct debit
    And I click Setup Direct Debit button
    And I select the Bank Account option for Direct Debit
    And I enter the bank account details with the following
      | BSB | Account Name | Account Number |
      | 032067 | Test | 10235242 |
    And I navigate to Bills & Payments Page
    And I dismiss popup
    Then the Bank Account form should be displayed
    And I navigate to Bills & Payments Page
    And I accept popup
    Then I should see Bills & Payments page title
    And I logout

  Scenario: Postpay account dismisses and accepts popup when leaving the direct debit credit card setup
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit
    Then I should see a link to setup direct debit
    And I click Setup Direct Debit button
    And I select the Credit Card option for Direct Debit
    And I enter the credit card details with the following
      | Name on card | Card number      | Expiry date | CCV |
      | Test     | 4111111111111111 | 10/20       | 123 |
    And I navigate to Bills & Payments Page
    And I dismiss popup
    Then the Credit Card form should be displayed
    And I navigate to Bills & Payments Page
    And I accept popup
    Then I should see Bills & Payments page title
    And I logout







  


