  @roaming
  Feature: As a vodafone customer I should be able to see my international roaming status
  As a postpay and prepay customer
  I want to log in to My Vodafone
  So that I can view my international roaming status
 
  Scenario: Logged in prepay user and update IR status
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "prepay_voice" 
    And I navigate to the International Roaming page from My Usage
    Then I should see my International Roaming settings status
    And I change my International Roaming settings
    And I check International Roaming T&Cs
    And the VF Traveller option should be "unavailable"
    And the DAS option should be "unavailable"
    And I should not have the option to select a different service on my account
    And I save the International Roaming settings
    And I am informed that the International Roaming settings are being updated
    And I navigate to the International Roaming page
    And I should see my International Roaming settings status
    And I change my International Roaming settings
    And I logout

  Scenario: Logged in prepay user and navigate to international roaming (IR) page to see rates & offers
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "prepay_voice" 
    And I navigate to the International Roaming page from My Usage
    And I navigate to rates and offers from International Roaming 
    And I logout

  Scenario: User cannot access VCA to read more on Overseas Data addons from postpay MSISDN
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple" 
    And I navigate to the International Roaming page
    Then I should see my International Roaming settings status
    And I should not see manage add-ons from International Roaming
    And I logout
 
   Scenario: Logged in postpay simple user and navigate to international roaming (IR) page 
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple"
    And I should see international roaming section on my usage
    And I navigate to the International Roaming page from My Usage
    Then I should see my International Roaming settings status
    And I change my International Roaming settings
    And I should not have the option to select a different service on my account
    And I logout

  Scenario: Logged in postpay complex user and navigate to international roaming (IR) page 
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_complex" 
    And I navigate to the International Roaming page
    And I enter a valid pin and submit
    Then I should see my International Roaming settings status
    And I change my International Roaming settings
    And I should have the option to select a different service on my account
    And I logout
 
  Scenario: Logged in user gets a Pop up message for leaving the page without saving settings on IR page
   Given I open e2e WSS login page
   When I log in with a valid msisdn with "postpay_complex"
   And I should see international roaming section on my usage
   And I navigate to the International Roaming page from My Usage
   And I enter a valid pin and submit
   Then I should see my International Roaming settings status
   And I change my International Roaming settings
   And I follow More Services link
   And I dismiss popup
   Then I should see "International Roaming"
   And I navigate to Bills & Payments Page
   And I confirm popup
   Then I should see Bills & Payments page title
   And I logout


