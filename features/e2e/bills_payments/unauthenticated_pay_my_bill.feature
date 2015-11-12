@expressbill
Feature: Unauthenticated pay my bill page validation  
  As a postpay customer
  I should be informed with correct validation messages for the data I entered
  so that I ensure the right information is used

  Scenario: As a postpay customer I can see my msisdn and payment details in pay bill review page 
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "411111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should be reviewing the pay bill information
    And I should see "postpay_simple" as my service number

  Scenario: As a postpay customer I can see my BAN and payment details in pay bill review page 
    Given I open pay my bill non loggedin page
    When I enter the ban "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "411111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should be reviewing the pay bill information
    And I should see "postpay_simple" as my account number

  Scenario: Attempt to leave payment amount field blank
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of ""
    And I fill in "cardNo" with "411111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should see an error message saying that the payment amount cannot be empty
    
  Scenario: Attempt to leave credit card holder name field blank
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "411111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with ""
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should see an error message saying that the credit card holder name cannot be empty

  Scenario: Attempt to enter an invalid number of digits in credit card number field
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "411111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should see an error message saying that the credit card number is invalid

  Scenario: Attempt to leave Expiry date field blank
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "4111111111111111"
    And I fill in "cardExpiry" with ""
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should see an error message saying that the credit card expiry date cannot be empty

  Scenario: Attempt to leave Expiry date field blank
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "4111111111111111"
    And I fill in "cardExpiry" with ""
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should see an error message saying that the credit card expiry date cannot be empty

  Scenario: Attempt to enter an invalid CCV value
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "4111111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "11"
    And I click Pay Bill Next button
    Then I should see an error message saying that the credit card ccv is invalid

  Scenario: Attempt to leave CCV field blank
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "4111111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with ""
    And I click Pay Bill Next button
    Then I should see an error message saying that the credit card ccv cannot be empty

  Scenario: Surcharge information should display for all credit cards
    Given I open pay my bill non loggedin page
    When I fill in "cardNo" with "4111111111111111"
    Then I should see a Visa specific surchage message
    And I fill in "cardNo" with "378282246310005"
    And I should see an American Express specific surchage message
    And I fill in "cardNo" with "30569309025904"
    And I should see a Diners Club specific surchage message
    And I fill in "cardNo" with "5555555555554444"
    And I should see a Mastercard specific surchage message
    And I should see verisign information

  Scenario: Not empty Honeypot field should keep the application from contacting Fusion
    Given I open pay my bill non loggedin page
    When I enter the msisdn "postpay_simple" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "411111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And honeypot field filled by a spam bot
    And I click Pay Bill Next button
    And I click Pay Bill Pay button
    And I am in pay my bill non loggedin page

  @wip
  Scenario: Error scenario using invalid MSISDN
    Given I open pay my bill non loggedin page
    When I enter an invalid msisdn to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "411111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should be reviewing the pay bill information
    And I click Pay Bill Pay button
    Then I should see a "The mobile service number you entered could not be found" error
    And I should not see an option to view bills and payments
   
  @wip
  Scenario: Error scenario using invalid BAN
    Given I open pay my bill non loggedin page
    When I enter the ban "invalid_ban" to pay a bill for
    And I enter a bill payment amount of "$10"
    And I fill in "cardNo" with "411111111111111"
    And I fill in "cardExpiry" with "0115"
    And I fill in "cardHolderName" with "John Smith"
    And I fill in "cardSecureId" with "111"
    And I click Pay Bill Next button
    Then I should be reviewing the pay bill information
    And I click Pay Bill Pay button
    Then I should see a "Invalid Billing Account Number provided" error
    And I should not see an option to view bills and payments