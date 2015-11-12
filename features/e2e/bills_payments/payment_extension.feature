  @extension
  Feature:  As a customer
  I want to see an option to request a payment extension

  Scenario: Logged in postpay simple user and navigate to to bills & payments page I should see the payment extension page and faq link
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple" 
    And I navigate to Bills & Payments Page
    Then I should see Bills & Payments page title
    Then I should see a link to request a payment extension
    And I follow the link to request a payment extension
    And I should see a link to find out more about payment extensions
    And I logout

  Scenario: Logged in postpay simple user and navigate to to bills & payments page I should not see the payment extension link (direct debit)
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex" 
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit
    Then I should see Bills & Payments page title
    Then I should not see a link to request a payment extension
    And I logout

  Scenario: Logged in postpay simple user and navigate to to bills & payments page I should not see the payment extension link (zero balance)
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_zero_owed" 
    And I navigate to Bills & Payments Page
    And I enter a valid pin and submit    
    Then I should see Bills & Payments page title
    Then I should not see a link to request a payment extension
    And I logout
 
