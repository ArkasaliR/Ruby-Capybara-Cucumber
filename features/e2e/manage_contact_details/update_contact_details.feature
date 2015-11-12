@mad
Feature: Update contact details
  As a postpaid user
  I want to be able to update my contact details


Scenario: Be able to update, submit and review postpay account details information
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I navigate to Contact Details page
    And I should see "postpay_simple" as my account number 
    And I should see a link to Manage billing options
    Then I uncheck the postal address checkbox
    And I update the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone home | Unit | 5 | 333 | George | Parade | SYDNEY | 2000 | SA   |
    And I update the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone postal | Unit | 6 | 32 | Mount | Avenue | SYDNEY | 2222 | VIC   | 
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I click the Manage Details button
    And I should see the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone home | Unit | 5 | 333 | George | Parade | SYDNEY | 2000 | SA   |
    And I should see the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone postal | Unit | 6 | 32 | Mount | Avenue | SYDNEY | 2222 | VIC   | 
    And I update the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson | 61404000030 | 61404000020 | madtest@vodafone.com.au | Vodafone home update | Unit | 6 | 12 | Sussex | Highway | SYDNEY CBD | 2424 | NSW   |
    And I update the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson | 61404000030 | 61404000020 | madtest@vodafone.com.au | Vodafone upate postal | Unit | 2 | 333 | Pitt | Crescent | SYDNEY CBD | 3333 | TAS   | 
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I click the Manage Details button
    And I should see the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson | 61404000030 | 61404000020 | madtest@vodafone.com.au | Vodafone home update | Unit | 6 | 12 | Sussex | Highway | SYDNEY CBD | 2424 | NSW   |
    And I should see the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson | 61404000030 | 61404000020 | madtest@vodafone.com.au | Vodafone upate postal | Unit | 2 | 333 | Pitt | Crescent | SYDNEY CBD | 3333 | TAS   | 
    And I logout
    
Scenario: Be able to update, submit and review complex contact account details information
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to Contact Details page
    And I enter a valid pin and submit
    And I should see a link to Manage billing options
    Then I uncheck the postal address checkbox
    And I update the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone home | Shop | 5 | 1 | Albert | Road | SYDNEY | 2001 | NSW   |
    And I update the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone postal | Apartment | 14 | 32 | Mount | Avenue | SYDNEY | 2209 | WA   | 
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I click the Manage Details button    
    And I should see the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone home | Shop | 5 | 1 | Albert | Road | SYDNEY | 2001 | NSW   |
    And I should see the billing contact details with the following
      | Country Name| Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone postal | Apartment | 14 | 32 | Mount | Avenue | SYDNEY | 2209 | WA   | 
    And I update the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson | 61404000030 | 61404000200 | madtest@vodafone.com.au | Vodafone home update | Unit | 6 | 12 | Sussex | Avenue | SYDNEY CBD | 2424 | NSW   |
    And I update the billing contact details with the following
      |Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson | 61404000030 | 61404000200 | madtest@vodafone.com.au | Vodafone upate postal | Unit | 2 | 13 | George | Street | SYDNEY CBD | 3333 | TAS   | 
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I click the Manage Details button
    And I should see the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson | 61404000030 | 61404000200 | madtest@vodafone.com.au | Vodafone home update | Unit | 6 | 12 | Sussex | Avenue | SYDNEY CBD | 2424 | NSW   |
    And I should see the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson | 61404000030 | 61404000200 | madtest@vodafone.com.au | Vodafone upate postal | Unit | 2 | 13 | George | Street | SYDNEY CBD | 3333 | TAS   | 
    And I logout

Scenario: Be able to get validation error messages on update contact details with empty fields
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I navigate to Contact Details page
    And I update the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson |  |  |  | Vodafone home |  |  |  |  |  |  |  | SA   |
    And I update the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | | Jimmy Johnson |  |  |  | Vodafone postal |  |  |  |  |  |  |  | VIC   | 
    And I save the Contact Details settings
    And I should see empty fields validation errors
    And I logout

Scenario: Be able to get validation error messages on update contact details with inavlid data
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I navigate to Contact Details page
    And I update the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Jimmy Johnson | 9876543 | 1234567 | #madtest@update@vodafone.com.au | Vodafone home | Unit |  | 12 | GEORGE | Street | SYDNEY | 1234 | SA   |
    And I update the billing contact details with the following
      | Contry Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State | 
      | Australia | Jimmy Johnson | 9876543 | 1234567 | #madtest@update@vodafone.com.au | Vodafone home |  | 13 | 333 | GEORGE | Street | SYDNEY CBD | 2000 | SA   |
    And I save the Contact Details settings
    And I should see validation errors
    And I logout


Scenario: Be able to update International billing address, submit and review complex account details information
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex"
    And I navigate to Contact Details page
    And I enter a valid pin and submit
    And I should see a link to Manage billing options
    Then I uncheck the postal address checkbox
    And I update the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email | Address Line1 | Address Line2 | City |
      | United States of America | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Georgia address 1asd | Georgia address 2asd | Atlanta |
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I click the Manage Details button
    And I should see the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email | Address Line1 | Address Line2 | City |
      | United States of America | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Georgia address 1asd | Georgia address 2asd | Atlanta |
    And I update the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson | 61404000030 | 61404000200 | madtest@vodafone.com.au | Vodafone upate postal | Unit | 2 | 13 | George | Street | SYDNEY CBD | 3333 | TAS   | 
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I click the Manage Details button
    And I should see the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson | 61404000030 | 61404000200 | madtest@vodafone.com.au | Vodafone upate postal | Unit | 2 | 13 | George | Street | SYDNEY CBD | 3333 | TAS   | 
    And I logout
