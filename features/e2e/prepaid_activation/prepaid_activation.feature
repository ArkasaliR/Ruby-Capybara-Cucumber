@activation
Feature: Prepay Activation
  As a prepay customer
  I'd like to be able to activate my SIM using real id
   
  Scenario Outline: Be able to activate SIM card using passport as proof of id
   Given I open prepaid SIM activation page
   When I start activation
   And I provide Activation Key and Pin and Check SIM
   And I enter new activation pin "0000"
   And I press Continue button
   And I fill the personal details with the following
    | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
    | Mr    |Ravi Arkasali      |     Arkasali  | M         | 15/12/1987 | Home         | 0286147900     |Jimmy@vodafone.com.au | 1-5 George St |
   Then I should see qas address with the following
    |Address line|
    | 1-5 George Street, MORTDALE  NSW  2223 |
   When I select "1-5 George Street, MORTDALE  NSW  2223" from qas
   And I press Continue About you button
   And I fill in my "<identification type>" details as proof of id
    | Identification type   | Reference number    | Country   | Expiry date | State   | Row   | Medicare card colour | Middle name   |
    | <identification type> | <reference number>  | <country> |<expiry date>| <state> |<row>  |<medicare card colour>| <middle name> |
   And I click the document verification continue button
   Then I should see message id has been verified
   And I click the document verification continue button
   Then I expand "Select a new number" collapsible
   And I select a number in the number selection block
   And I click continue button in the number selection block
   And I check T&C checkboxes
   #And I confirm prepay activation
  # Then I should see the activation success message
   Examples:
    | identification type | reference number | country    | expiry date | state | row | medicare card colour | middle name |
    | Passport            | L7619677        | India   | 12/03/2024  |       |     |                      |             |

   
  Scenario Outline: Be able to activate SIM card using medicare as a proof of id
   Given I open prepaid SIM activation page
   When I start activation
   And I provide Activation Key and Pin and Check SIM
   And I enter new activation pin "0000"
   And I press Continue button
   And I fill the personal details with the following
    | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
    | Mr    | Syed       | Hussain   | M         | 30/04/1984 | Home         | 0286147900     |Jimmy@vodafone.com.au | 1-5 George St |
   Then I should see qas address with the following
    |Address line|
    | 1-5 George Street, MORTDALE  NSW  2223 |
   When I select "1-5 George Street, MORTDALE  NSW  2223" from qas
   And I press Continue About you button
   And I fill in my "<identification type>" details as proof of id
    | Identification type   | Reference number    | Row | Country   | Expiry date | State   | Row   | Medicare card colour | Middle name   |
    | <identification type> | <reference number>  | <row> | <country> |<expiry date>| <state> |<row>  |<medicare card colour>| <middle name> |
   And I click the document verification continue button
   Then I should see message id has been verified
   And I click the document verification continue button
   Then I expand "Select a new number" collapsible
   And I select a number in the number selection block
   And I click continue button in the number selection block
   And I check T&C checkboxes
   #And I confirm prepay activation
   Then I should see the activation success message
   Examples:
    | identification type | reference number | row | country    | expiry date | state | row | medicare card colour | middle name |
    | Medicare Card       | 2643328735       |  1  |        | 16/06/2015  |       | 1   | green                | john        |

  Scenario Outline: Be able to activate SIM card using drivers licence as a proof of id
   Given I open prepaid SIM activation page
   When I start activation
   And I provide Activation Key and Pin and Check SIM
   And I enter new activation pin "0000"
   And I press Continue button
   And I fill the personal details with the following
    | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
    | Mrs   | Jupody     | Thuckk    | F         | 24/04/1988 | Home         | 0286147900     |Jimmy@vodafone.com.au | 1-5 George St |
   Then I should see qas address with the following
    |Address line|
    | 1-5 George Street, MORTDALE  NSW  2223 |
   When I select "1-5 George Street, MORTDALE  NSW  2223" from qas
   And I press Continue About you button
   And I fill in my "<identification type>" details as proof of id
    | Identification type   | Reference number    | Country   | Expiry date | State   | Row   | Medicare card colour | Middle name   |
    | <identification type> | <reference number>  | <country> |<expiry date>| <state> |<row>  |<medicare card colour>| <middle name> |
   And I click the document verification continue button
   Then I should see message id has been verified
   And I click the document verification continue button
   Then I expand "Select a new number" collapsible
   And I select a number in the number selection block
   And I click continue button in the number selection block
   And I check T&C checkboxes
   #And I confirm prepay activation
   Then I should see the activation success message
   Examples:
    | identification type | reference number | country    | expiry date | state | row | medicare card colour | middle name |
    | Driver's Licence    | 1295324       |            | 18/08/2015  | NT    |     |                      |             |

  Scenario Outline: Be able to activate SIM card using no id
   Given I open prepaid SIM activation page
   When I start activation
   And I provide Activation Key and Pin and Check SIM
   And I enter new activation pin "0000"
   And I press Continue button
   And I fill the personal details with the following
    | Title | First Name | Last Name | Gender    | DOB        | Contact type | Contact number | Email                | Address     |
    | Mrs   | Judy       | Thuch     | F         | 24/04/1988 | Home         | 0286147900     |Jimmy@vodafone.com.au | 1-5 George St |
   Then I should see qas address with the following
    |Address line|
    | 1-5 George Street, MORTDALE  NSW  2223 |
   When I select "1-5 George Street, MORTDALE  NSW  2223" from qas
   And I press Continue About you button
   And I select the option to skip ID check
   And I click the document verification continue button
   Then I should see message id has not been verified
   And I click the document verification continue button
   Then I expand "Select a new number" collapsible
   And I select a number in the number selection block
   And I click continue button in the number selection block
   And I check T&C checkboxes
   #And I confirm prepay activation
   Then I should see the activation success message
   Examples:
    | identification type | reference number | country    | expiry date | state | row | medicare card colour | middle name |
    | I don’t have I.D.   |                  |            |             |       |     |                      |             |