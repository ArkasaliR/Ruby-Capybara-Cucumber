@paymenthistory
  Feature:  As a vodafone customer
  I want to see my payment history

  Scenario: By default customer see payment history for last month
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
#    When I log in with a postpay msisdn with 0410000018 
    And I navigate to Bills & Payments Page
    And I select Payments tab
    Then I should see payment details for "Last month"
    Then I should see a filter button
    And I logout

 
  Scenario: Customer can see payment history for last six months
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
#    When I log in with a postpay msisdn with 0410000018 
    And I navigate to Bills & Payments Page
    And I select Payments tab
    And I click filter button
    And I select option "Last 6 months" in the payment history filter
    Then I should see payment details for "Last 6 months"
    And I logout


  Scenario: Customer can see payment history for all
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
#    When I log in with a postpay msisdn with 0410000018 
    And I navigate to Bills & Payments Page
    And I select Payments tab
    And I click filter button
    And I select option "All" in the payment history filter
    Then I should see payment details for "All"
    And I click "View more" button if exist on payment history page
    And I should see "For payments older than 2 years please"
    And I should see a link "contact customer care"
    And I logout


   Scenario: Customer can see payment history for last year
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
#    When I log in with a postpay msisdn with 0410000018 
    And I navigate to Bills & Payments Page
    And I select Payments tab
    And I click filter button
    And I select option "Last year" in the payment history filter
    Then I should see payment details for "Last year"
    And I logout  