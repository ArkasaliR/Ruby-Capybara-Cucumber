@dealer
Feature: Dealer Activation
  As a dealer
  I'd like to be able to activate SIM using activation key and pin
  
  Background:
    Given I go to the dealer activation page
    And I login with "user_id" and "password"

  Scenario: Be able to activate SIM card using passport as proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr    | Ravi   | Arkasali     | Male         | 12/12/1986 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Passport details as proof of id for dealer activation
      | Identification type   | Reference number    | Country   | Expiry date |
      | Passport            | A1234567        | India   | 03/03/2022 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using medicare as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr    | Ravi       | Arkasali   | Male         | 12/12/1986 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Medicare Card details as proof of id for dealer activation
      | Identification type   | Reference number    | Expiry date |
      | Medicare Card       | 2740222143       | 16/06/2024 |
    And I fill in my Account Form details as proof for identification
      | Identification type2   | Reference number2    | Expiry date2 |
      | Account Form         | 1234567           |12/03/2024 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using drivers licence as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr   | Ravi     | Arkasali   | Male        | 12/12/1986 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Driver's Licence details as proof of id for dealer activation
      | Identification type   | Reference number    | State   | Expiry date |
      | Driver's Licence    | 512043555        |  NSW  |24/01/2018 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using birth certificate as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr   | Ravi     | Arkasali   | Male        | 12/12/1985 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Birth certificate details as proof of id for dealer activation
      | Identification type   | Reference number    |
      | Birth certificate    | 27121991        |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using concession card as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr   | Ravi     | Arkasali   | Male        | 12/12/1984 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Concession Card details as proof of id for dealer activation
      | Identification type   | Reference number    |Expiry date |
      | Concession Card    | 170919999        |24/01/2018 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using proof of age as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr   | Ravi     | Arkasali   | Male        | 12/12/1983 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Proof of Age details as proof of id for dealer activation
      | Identification type   | Reference number    |State |
      | Proof of Age    | 170919999        |NSW |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using student id as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr   | Ravi     | Arkasali   | Male        | 12/12/1982 | Mobile         | 0412345678    |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Student ID details as proof of id for dealer activation
      | Identification type   | Reference number    |Expiry date |
      | Student ID    | 170919999        |24/01/2018 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using Debit/ATM Card as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr   | Ravi     | Arkasali   | Male        | 12/12/1981 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Debit/ATM Card details as proof of id for dealer activation
      | Identification type   | Reference number    |Expiry date |
      | Debit/ATM Card    | 17091999915121987        |24/01/2018 |
    And I fill in my Account Form details as proof for identification
      | Identification type2   | Reference number2    | Expiry date2 |
      | Account Form         | 1234567           |12/03/2024 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using Credit Card as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr  | Ravi     | Arkasali   | Male        | 12/12/1980 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Credit Card details as proof of id for dealer activation
      | Identification type   | Reference number    | Credit card type | Expiry date |
      | Credit Card    | 170919999121334325        | Visa         | 24/01/2018 |
    And I fill in my Account Form details as proof for identification
      | Identification type2   | Reference number2    | Expiry date2 |
      | Account Form         | 1234567           |12/03/2024 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using Passbook as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr   | Ravi     | Arkasali   | Male        | 12/12/1999 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Passbook details as proof of id for dealer activation
      | Identification type   | Reference number    |Expiry date |
      | Passbook    | 1709199991212        |24/01/2018 |
    And I fill in my Account Form details as proof for identification
      | Identification type2   | Reference number2    | Expiry date2 |
      | Account Form         | 1234567           |12/03/2024 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out


  Scenario: Be able to activate SIM card using Account Form as a proof of id
    When I start activation
    And I provide Activation Key and Pin and Check SIM
    And I enter new activation pin "0000"
    And I press Continue button
    And I fill the personal details with the following
      | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
      | Mr   | Ravi     | Arkasali   | Male        | 12/12/1998 | Mobile         | 0412345678     |Ravi.Arkasali@vodafone.com.au | Level 3 40 Mount Street |
    Then I should see qas address with the following
      |Address line|
      | Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060 |
    When I select "Level 3  40 Mount Street, NORTH SYDNEY  NSW  2060" from qas
    And I capture a screenshot
    And I fill in my Account Form details as proof of id for dealer activation
      | Identification type   | Reference number    |Expiry date |
      | Account Form    | 17091999912343        |24/01/2018 |
    And I fill in my Debit/ATM Card details as proof for identification
      | Identification type2   | Reference number2    | Expiry date2 |
      | Debit/ATM Card    | 17091999915121987        |24/01/2018 |
    And I capture a screenshot
    And I click the continue button
    Then I expand "Select a new number" collapsible
    And I select a number in the number selection block
    And I click continue button in the number selection block
    And I check T&C checkboxes
    And I capture a screenshot
    And I Sign out

