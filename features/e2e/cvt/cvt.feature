@automated_cvt
Feature: My Vodafone CVT Scenarios
  As a tester
  I want to log in to My Vodafone
  So that I can run automated CVT tests and capture screenshots

  Scenario: As a vodafone customer I want to login with going to WSSA/AAA first
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    Then I am directed to My usage page
    And I should see "postpay_simple" as my service number
    And I logout

  Scenario: As a postpay complex customer I want to purchase data addons
    Given I log into self service directly with "postpay_complex_new"
    And I navigate to the My addons page
    And I select Add Data
    And I capture a screenshot
    And I select the my "$ 10 /month 1GB" add-on to purchase
    Then I should see Review "$10 1GB Data Add-on Month to Month" addon page details
    And I capture a screenshot
    And I Agree to the terms and conditions
    And I press the cancel button
    And I logout

  Scenario: Display the data and the days left as per the entitlements on the Data usage dials
    Given I log into self service directly with "postpay_simple"
    Then I should retrieve my entitlements
    And I capture a screenshot
    When I follow Data Usage link
    Then I should see data usage dials
    And I capture a screenshot
    And I logout

  Scenario: I should be able to setup the Direct Debit with bank account and view the saved Direct Debit details
    Given I log into self service directly with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit
    And I select Setup Direct Debit option
    And I capture a screenshot
    And I select the Bank Account option for Direct Debit
    And I enter the bank account details with the following
      | BSB | Account Name | Account Number |
      | 032067 | Test | 10235242 |
    And I submit the request
    Then I should see the Done success message
    And I navigate to My Usage page
    And I navigate to Bills & Payments Page
    Then I should see a link to manage direct debit
    And I capture a screenshot
    And I click Manage Direct Debit button
    And I click Cancel Direct Debit button
    Then I should see cancel direct debit confirmation message
    And I click Cancel Direct Debit button
    Then I should see the Done success message
    And I should see successful direct debit cancellation message
    And I capture a screenshot
    And I logout

  Scenario: As a postpay user I want to view my usage details
    Given I log into self service directly with "postpay_simple"
    When I follow Data Usage link
    Then I should see All Usage link
    And I capture a screenshot
    And I follow All Usage link
    Then I should see "postpay_simple" as my service number
    And I capture a screenshot
    And I logout

  Scenario: As a postpay user I want to view data usage
    Given I log into self service directly with "postpay_simple"
    Then I should see Data Usage link
    And I capture a screenshot
    When I follow Data Usage link
    Then I should see data usage page
    And I capture a screenshot
    And I logout

  Scenario: Be able to update, submit and review postpay contact account details information
    Given I log into self service directly with "postpay_simple"
    And I navigate to Contact Details page
    And I should see "postpay_simple" as my account number
    And I should see a link to Manage billing options
    Then I uncheck the postal address checkbox
    And I update the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone home | Unit | 5 | 333 | George | Parade | SYDNEY | 2000 | SA   |
    And I update the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email | Address Line1 | Address Line2 | City |
      | United States of America | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Georgia address 1asd | Georgia address 2asd | Atlanta |
    And I capture a screenshot
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I capture a screenshot
    And I click the Manage Details button
    And I should see the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Vodafone home | Unit | 5 | 333 | George | Parade | SYDNEY | 2000 | SA   |
    And I should see the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email | Address Line1 | Address Line2 | City |
      | United States of America | Jimmy Johnson |  | 61404000020 | madtest@vodafone.com.au | Georgia address 1asd | Georgia address 2asd | Atlanta |
    And I capture a screenshot
    And I update the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Jimmy Johnson | 61404000030 | 61404000020 | madtest@vodafone.com.au | Vodafone home update | Unit | 6 | 12 | Sussex | Highway | SYDNEY CBD | 2424 | NSW   |
    And I update the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson | 61404000030 | 61404000020 | madtest@vodafone.com.au | Vodafone upate postal | Unit | 2 | 333 | Pitt | Crescent | SYDNEY CBD | 3333 | TAS   |
    And I capture a screenshot
    And I save the Contact Details settings
    And I should see Good news page Success message
    And I capture a screenshot
    And I click the Manage Details button
    And I should see the customer contact details with the following
      | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Jimmy Johnson | 61404000030 | 61404000020 | madtest@vodafone.com.au | Vodafone home update | Unit | 6 | 12 | Sussex | Highway | SYDNEY CBD | 2424 | NSW   |
    And I should see the billing contact details with the following
      | Country Name | Customer Name | Work Phone | Home Phone | Contact Email     | Care of | Floor Type | Floor Number | Street Number | Street Name | Street Type | City | Postcode | State |
      | Australia | Jimmy Johnson | 61404000030 | 61404000020 | madtest@vodafone.com.au | Vodafone upate postal | Unit | 2 | 333 | Pitt | Crescent | SYDNEY CBD | 3333 | TAS   |
    And I capture a screenshot
    And I logout

  Scenario: Logged in prepay user and navigate to international calling page to update statusl
    Given I log into self service directly with "prepay_voice"
    And I navigate to the International Calling page
    Then I should see my International Calling settings status
    And I capture a screenshot
    Then I change my International Calling settings
    And I capture a screenshot
    And I save the International Calling settings
    And I am informed that the International Calling settings are being updated
    And I capture a screenshot
    And I navigate to the International Calling page
    And I should see my International Calling settings status
    And I capture a screenshot
    And I logout

  Scenario: Logged in postpay complex user and navigate to to international calling page to update status
    Given I log into self service directly with "postpay_complex"
    And I navigate to the International Calling page
    And I enter a valid pin and submit
    Then I should see my International Calling settings status
    And I capture a screenshot
    Then I change my International Calling settings
    And I capture a screenshot
    And I logout

  Scenario: Logged in prepay user and navigate to international roaming (IR) page to see rates & offers
    Given I log into self service directly with "prepay_voice_omni"
    And I navigate to the International Roaming page from My Usage
    Then I should see my International Roaming settings status
    And I navigate to rates and offers from International Roaming
    And I capture a screenshot
    And I logout

  Scenario: As a simple customer I want to change my vodafone alert
    Given I log into self service directly with "postpay_simple"
    When I navigate to the Vodafone Alerts page from the My usage page
    Then I should see my Alerts settings status
    And I capture a screenshot
    Then I change my Vodafone Alerts settings
    And I should not have the option to select a different service on my account
    And I capture a screenshot
    And I logout

  Scenario: As a complex customer I want to change my vodafone alert
    Given I log into self service directly with "postpay_complex"
    And I click change button
    And I enter a valid pin and submit
    When I navigate to the Vodafone Alerts page from the My usage page
    Then I should see my Alerts settings status
    And I capture a screenshot
    Then I change my Vodafone Alerts settings
    And I should have the option to select a different service on my account
    And I capture a screenshot
    And I logout

  Scenario: As a prepay user I want to view my account summary information
    Given I log into self service directly with "prepay_voice_omni"
    Then I should see "prepay_voice_omni" as my service number
    And I should see my "prepay_voice_omni" plan name
    And I capture a screenshot
    And I logout

  Scenario: As a postpay user I want to view my account summary information for postpay
    Given I log into self service directly with "postpay_simple"
    Then I should see "postpay_simple" as my service number
    And I should see my "postpay_simple" plan name
    Then I should see Bills & Payments page title
    And I capture a screenshot
    And I logout

  Scenario: Viewing bills and payments summary for a complex user shows account name and number
    Given I log into self service directly with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit
    Then I should see "postpay_complex" as my account name
    Then I should see "postpay_complex" as my account number
    Then I should see Bills & Payments page title
    And I capture a screenshot
    And I logout

  Scenario: Viewing bills and payments summary for a simple user shows account name and number
    Given I log into self service directly with "postpay_simple"
    And I navigate to Bills & Payments Page
    Then I should see "postpay_simple" as my account name
    Then I should see "postpay_simple" as my account number
    And I capture a screenshot
    And I logout

  Scenario: User able to change MSISDN on credit card page
    Given an express recharge for unauthenticated msisdn "prepay_voice_omni" is started on e2e
    Given I select recharge using credit card
    And I change the phone number I want to recharge
    Then I should see message Recharge this number
    And I capture a screenshot

  Scenario: Logged in User should be able to recharge using a voucher
    Given I log into self service directly with "prepay_voice_omni"
    Then I select recharge
    When I choose recharge with voucher big button
    And I capture a screenshot
    When I enter a recharge voucher pin "173577233726" and submit
    And I capture a screenshot
    And I logout

  Scenario: Logged in MBB User should be able to recharge using a voucher
    Given I log into self service directly with "prepay_mbb_new"
    Then I select recharge
    When I choose Recharge with voucher big button
    And I capture a screenshot
    When I enter a recharge voucher pin "173577233726" and submit
    And I capture a screenshot
    And I logout

  Scenario: Prepay user should be able to submit a proof of purchase request
    Given I log into self service directly with "prepay_voice"
    And I navigate to the Account Settings page
    And I navigate to Proof of purchase page
    Then I should see Proof of purchase as my page title
    Then I fill the form to request proof of purchase with the following
      | Your name     | Email                            | Handset model   | Reason             | IMEI               | Purchased from |
      | SELFSERVICE TESTING DO NOT PROCESS | online_form_test@vodafone.com.au | Iphone 5S       | Repair purposes    | 123456789101112    | Online         |
    And I capture a screenshot
    And I submit proof of purchase request
    Then I should see proof of purchase confirmation page
    And I capture a screenshot
    And I logout

  Scenario: Postpay complex user should be able to submit a proof of purchase request
    Given I log into self service directly with "postpay_complex"
    And I navigate to the Account Settings page
    And I navigate to Proof of purchase page
    And I enter a valid pin and submit
    Then I should see Proof of purchase as my page title
    Then I fill the form to request proof of purchase with the following
      | Your name     | Email                            | Handset model   | Reason             | IMEI               | Purchased from |
      | SELFSERVICE TESTING DO NOT PROCESS  | online_form_test@vodafone.com.au | Iphone 5S       | Repair purposes    | 123456789101112    | Online         |
    And I select secondary number
    And I capture a screenshot
    And I submit proof of purchase request
    Then I should see proof of purchase confirmation page
    And I capture a screenshot
    And I logout

  Scenario: Postpay simple user should be able to see the SIM replacement page
    Given I log into self service directly with "postpay_simple"
    And I navigate to the Account Settings page
    And I capture a screenshot
    And I navigate to SIM replacement page
    And I capture a screenshot
    Then I should see SIM replacement as my page title
    And I logout

  Scenario: Customers can view and edit bill presentation options to not show call details
    Given I log into self service directly with "postpay_simple"
    And I navigate to the Billing Options page
    And I capture a screenshot
    And I edit the Billing presentation options to not show call details
    And I capture a screenshot
    And I save the option
    Then I should see a Success page
    And I capture a screenshot
    And I navigate to the Billing Options page
    Then I should see the Billing options set to not show call details
    And I logout

  Scenario: Customers can view and edit bill presentation options to show call details
    Given I log into self service directly with "postpay_simple"
    And I navigate to the Billing Options page
    And I edit the Billing presentation options to show call details
    And I capture a screenshot
    And I save the option
    Then I should see a Success page
    And I capture a screenshot
    And I navigate to the Billing Options page
    Then I should see the Billing options set to show call details
    And I logout

  Scenario: Customers can view and edit bill delivery options
    Given I log into self service directly with "postpay_simple"
    And I navigate to the Billing Options page
    Then I should see "Email bill to"
    And I should not see "Email me"
    And I capture a screenshot
#   And I edit the Billing delivery options to paper billing option
#   Then I should not see "Email bill to"
#   And I should see "Email me"
#   And I capture a screenshot
    And I logout

  Scenario: Customers can view and edit bill notifications options
    Given I log into self service directly with "postpay_simple"
    And I navigate to the Billing Options page
    And I edit the Billing notifications options to TXT
    And I capture a screenshot
    And I save the option
    Then I should see a Success page
    And I capture a screenshot
    And I navigate to the Billing Options page
    Then I should see the Billing notifications set to TXT
    And I logout

  Scenario: Customers can view and edit bill notifications options
    Given I log into self service directly with "postpay_simple"
    And I navigate to the Billing Options page
    And I edit the Billing notifications options to Email
    And I capture a screenshot
    And I save the option
    Then I should see a Success page
    And I capture a screenshot
    And I navigate to the Billing Options page
    Then I should see the Billing notifications set to Email
    And I logout

  Scenario: By default customer see payment history for last month
    Given I log into self service directly with "postpay_simple"
    And I navigate to Bills & Payments Page
    And I select Payments tab
    Then I should see payment details for "Last month"
    Then I should see a filter button
    And I capture a screenshot
    And I logout

  Scenario: Customer can see payment history for last six months
    Given I log into self service directly with "postpay_simple"
    And I navigate to Bills & Payments Page
    And I select Payments tab
    And I click filter button
    And I select option "Last 6 months" in the payment history filter
    And I capture a screenshot
    Then I should see payment details for "Last 6 months"
    And I capture a screenshot
    And I logout

  Scenario: Customer can see payment history for all
    Given I log into self service directly with "postpay_simple"
    And I navigate to Bills & Payments Page
    And I select Payments tab
    And I click filter button
    And I select option "All" in the payment history filter
    And I capture a screenshot
    Then I should see payment details for "All"
    And I click "View more" button if exist on payment history page
    And I should see "For payments older than 2 years please"
    And I should see a link "contact customer care"
    And I capture a screenshot
    And I logout

  Scenario: Customer can see payment history for last year
    Given I log into self service directly with "postpay_simple"
    And I navigate to Bills & Payments Page
    And I select Payments tab
    And I click filter button
    And I select option "Last year" in the payment history filter
    And I capture a screenshot
    Then I should see payment details for "Last year"
    And I capture a screenshot
    And I logout

  Scenario: As a prepay customers I have access to my adjustment history
    Given I log into self service directly with "prepay_voice"
    And I navigate to the Account Settings page
    Then I should see the adjustment history link
    And I capture a screenshot
    And I logout

  Scenario: As a prepay customers I have access to my adjustment history
    Given I log into self service directly with "prepay_voice"
    And I navigate to the Account Settings page
    And I click the adjustment history link
    Then I should see adjustment history
    And I click "View more" button if exist on adjustment history page
    And I should see "For older adjustments please"
    And I should see a link "contact customer care"
    And I capture a screenshot
    And I logout

  Scenario: Prepay customers can view recharge history via the link in the account settings page
    Given I log into self service directly with "prepay_voice"
    And I navigate to the Account Settings page
    Then I capture a screenshot
    Then I should see the recharge history link
    Then I click on the recharge history link
    And I logout

  Scenario: Prepay customers can view recharge history via Quick links in My usage page
    Given I log into self service directly with "prepay_voice_omni"
    Then I capture a screenshot
    Then I should see the recharge history link under Quick links in My usage page
    Then I click on the recharge history link
    And I logout

  Scenario: Prepay customers can view recharge history the link in the Recharge now page
    Given I log into self service directly with "prepay_voice_omni"
    Then I click on Recharge button in the My usage page
    Then I capture a screenshot
    Then I should see the recharge history link
    Then I click on the recharge history link
    And I logout

  Scenario: Prepay customers can view and verify the recharge history page
    Given I log into self service directly with "prepay_voice_omni"
    Then I capture a screenshot
    Then I should see the recharge history link under Quick links in My usage page
    Then I click on the recharge history link
    Then I capture a screenshot
    Then I should see the recharge history title
    Then I should see the download csv icon
    Then I should see the number of records showing
    And I click "View more" button if exist on recharge history page
    Then I capture a screenshot
    And I should see "For older recharge history please"
    And I should see a link "contact customer care"
    Then I should see Quick links
    And I should see Help & Support links
    And I logout

  Scenario: Postpay user should be able to submit a rate plan change request using "/change_rate_plan" link
    Given I open the rate plan change deep link page using "/change_rate_plan"
    When I log in with a valid msisdn with "postpay_simple_new"
    Then I should see current Plan details on the page
    And I logout

  Scenario: Logged in prepay user and update IR status
    Given I log into self service directly with "prepay_voice_omni"
    And I navigate to the International Roaming page from My Usage
    Then I should see my International Roaming settings status
    And I capture a screenshot
    And I change my International Roaming settings
    And I check International Roaming T&Cs
    And the VF Traveller option should be "unavailable"
    And the DAS option should be "unavailable"
    And I should not have the option to select a different service on my account
    And I capture a screenshot
    And I save the International Roaming settings
    And I am informed that the International Roaming settings are being updated
    And I capture a screenshot
    And I navigate to the International Roaming page
    And I should see my International Roaming settings status
    And I capture a screenshot
    And I logout

  Scenario: Logged in prepay user and navigate to international calling page to follow further info page
    Given I log into self service directly with "prepay_voice"
    And I navigate to the International Calling page
    And I should see my International Calling settings status
    And I should be able to follow information on calling rates
    And I switch to new window
    And I should see "We’re making calls from Australia easier and more affordable."
    And I capture a screenshot
    And I close new window
    And I logout

#----------- PCI iframe---------------------------

  Scenario: I should be able to update the Direct Debit details from bank account to Credit card and then cancel the Direct Debit
    Given I log into self service directly with "postpay_complex"
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit
    And I select Setup Direct Debit option
    And I capture a screenshot
    And I select the Credit Card option for Direct Debit
    And I enter the credit card details with the following
      | Name on card    | Card number      | Expiry date | CCV |
      | Valued Customer | 4862700039804657 |    0917     | 699 |
    And I submit the request
    Then I should see the Done success message
    And I navigate to My Usage page
    And I navigate to Bills & Payments Page
    Then I should see a link to manage direct debit
    And I capture a screenshot
    And I click Manage Direct Debit button
    And I click Cancel Direct Debit button
    Then I should see cancel direct debit confirmation message
    And I click Cancel Direct Debit button
    Then I should see the Done success message
    And I should see successful direct debit cancellation message
    And I capture a screenshot
    And I logout

  Scenario: User is able to express recharge with the previous recharge details
    Given an express recharge for unauthenticated msisdn "prepay_voice_omni" is started on e2e
    And I select recharge using credit card
    Then I should get my last recharge details
    And I capture a screenshot
    When I choose to use the same recharge
    Then I should see my last recharge details
    And I capture a screenshot
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
      | Name on card    | Card number      | Expiry date | CCV |
      | testc approve   | 4564456445644564 |    1016     | 123 |
    And I check the accept T&C checkbox

  Scenario: MBB User is able to express recharge with the previous recharge details
    Given an express recharge for unauthenticated msisdn "prepay_mbb" is started on e2e
    And I select recharge using credit card
    Then I should get my last recharge details
    And I capture a screenshot
    When I choose to use the same recharge
    Then I should see my last recharge details
    And I capture a screenshot
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
      | Name on card    | Card number      | Expiry date | CCV |
      | testc approve   | 4564456445644564 |    1016     | 123 |
    And I check the accept T&C checkbox

  Scenario: Loggedin User is able to recharge with the previous recharge details
    Given I log into self service directly with "prepay_voice_omni"
    Then I select recharge
    Then I should get my last recharge details
    When I choose to use the same recharge
    And I capture a screenshot
    Then I should see my last recharge details
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
      | Name on card    | Card number      | Expiry date | CCV |
      | testc approve   | 376000000000006  |    1016     | 123 |
    And I check the accept T&C checkbox
    And I capture a screenshot
    And I logout

  Scenario: Logged in User is able to recharge with the previous recharge details
    Given I log into self service directly with "prepay_mbb"
    Then I select recharge
    Then I should get my last recharge details
    And I capture a screenshot
    When I choose to use the same recharge
    Then I should see my last recharge details
    And I capture a screenshot
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
      | Name on card    | Card number      | Expiry date | CCV |
      | testc approve   | 376000000000006  |    1016     | 123 |
    And I check the accept T&C checkbox
    And I logout

  Scenario: Prepay user be able to see same recharge pricepoints across plans
    Given I log into self service directly with "prepay_voice_omni"
    Then I select recharge
    When I choose to recharge with something else
    And I capture a screenshot
    And I click the I want this one button
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
      | Name on card    | Card number      | Expiry date | CCV |
      | testc approve   | 4564456445644564 |    1016     | 123 |
    And I check the accept T&C checkbox
    And I capture a screenshot
    And I logout

  Scenario: Prepay user be able to see same Data Add-ons pricepoints across plans
    Given I log into self service directly with "prepay_voice_omni"
    Then I select recharge
    When I choose to Buy an add-on
    Given I select the commercial offer "Data Add-ons"
    Then I should see Data Add-ons carousel page with commercial offers
    And I capture a screenshot
    And I click the I want this one button
    Then I select the Credit card payment method
    When I provide recharge with new CC details with the following
      | Name on card    | Card number      | Expiry date | CCV |
      | testc approve   | 4564456445644564 |    1016     | 123 |
    And I check the accept T&C checkbox
    And I capture a screenshot
    And I logout
