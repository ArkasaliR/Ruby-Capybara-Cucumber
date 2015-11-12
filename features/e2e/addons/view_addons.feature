@addons
Feature: As a vodafone customer I should be able to see addons I am eligible for
  As a postpay customer
  I want to log in to My Vodafone
  So that I can see eligible addons to my account

  Scenario: As a postpay customer I want to see My Add-ons page
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    Then I should see My Add-ons page title
    And I should see Data family group
    And I should see Talk and TXT family group
    And I should see International calls family group
    And I capture a screenshot    
    And I logout

  Scenario: As a postpay customer I want to see eligible Data packs
    Given I open e2e WSS login page
    And I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    When I select Add Data
    Then I should see Monthly Data addon title
    And I should see Monthly data addons
    And I capture a screenshot
    And I should see One-off Data booster title
    And I click to view Data boosters
    And I capture a screenshot
    And I should see One-off Data boosters
    And I follow Cancel from Data boosters page
    And I am directed to My addons page
    And I logout

  Scenario: As a postpay customer I want to see eligible Talk and TXT packs
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    And I select Add Talk and TXT
    And I should see One-off Talk and TXT booster title
    And I should see One-off Talk and TXT boosters
    And I capture a screenshot
    When I follow "Cancel"
    Then I am directed to My addons page
    And I logout

  Scenario: As a postpay customer I want to see eligible International Direct Dial packs
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    And I select Add International calls
    Then I should see Monthly International calls addon title
    And I should see Monthly idd addons
    And I capture a screenshot
    When I follow "Cancel"
    Then I am directed to My addons page
    And I logout

  Scenario: As a mbb postpay customer I want to see Review add-ons page before confirming the purchase of addons
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    And I select Add Data
    And I should see Monthly data addons
    And I select the my "$ 10 /month 500MB" add-on to purchase
    Then I should see Review addon page title
    And I should see Review "$10 500MB Data Add-on Month" addon page details
    And I capture a screenshot
    And I follow "Cancel"
    And I am directed to Data addons and boosters details page
    And I logout

  Scenario: As a postpay customer I want to see Review add-ons page before confirming the purchase of boosters
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    And I select Add Talk and TXT
    And I select the my "$ 15 /one-off $90 value for Calls and TXT" booster to purchase
    Then I should see Review addon page title
    And I capture a screenshot
    And I follow "Cancel"
    And I am directed to Talk and TXT addons and boosters details page
    And I logout

  Scenario: As a postpay complex customer I want to see eligible packs in my child accounts
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_complex"
    And I navigate to the My addons page
    And I enter a valid pin and submit
    And I should see My Add-ons page title
    Then I select my child account
    And I capture a screenshot
    And I should see My Add-ons page details for my child account
    And I select Change Data Add-on
    And I am directed to Data addons and boosters details page
    And I capture a screenshot
    And I follow "Cancel"
    And I am directed to My Add-ons page for my child account
    And I logout

 Scenario: As a postpay legacy customer I want to see all legacy Data packs
    Given I open e2e WSS login page
    And I log in with a valid msisdn with "postpay_addons_simple"
    And I navigate to the My addons page
    And I capture a screenshot
    When I select Add Data
    And I capture a screenshot
    And I should see Monthly Data addon title
    Then I should see following Data addons
    |             Addons              |
    |      $ 5 /month 150MB           |
    |      $ 5 /month 300MB           |
    |      $ 10 /month 500MB          |
    |      $ 10 /month 1GB            |
    |      $ 20 /month 2.5GB          |
    |      $ 20 /month 1.25GB         |
    |      $ 30 /month 4GB            |
    |      $ 30 /month 2GB            |
    |      $ 55 /month 8GB            |
    And I follow Cancel from Data addons page
    And I am directed to My addons page
    And I logout

#@uat2
  #Scenario: As a postpay customer I want to see eligible International Direct Dial boosters
    #Given I open e2e WSS login page
    #When I log in with a valid msisdn with "postpay_addons_simple_legacy"
    #And I navigate to the My addons page
    #And I select Change IDD Add-on
    #Then I should see One-off International calls boosters title
    #And I click to view International calls boosters
    #And I should see One-off International calls boosters
    #And I capture a screenshot
    #When I follow "Cancel"
    #Then I am directed to My addons page
    #And I logout

@uat2 
Scenario: As a postpay non-legacy customer I want to see all legacy & non-legacy Data packs
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_addons_simple_non_legacy"
    And I navigate to the My addons page
    And I select Add Data
    And I capture a screenshot
    Then I should see Monthly Data addon title
    And I should see following Data addons
    |             Addons              |
    |      $ 5 /month 300MB           |
    |      $ 5 /month 400MB           |
    |      $ 5 /month 150MB           |
    |      $ 10 /month 500MB          |
    |      $ 10 /month 1GB            |
    #|      $ 10 /month 1GB            |
    #|      $ 20 /month 2.5GB          |
    #|      $ 20 /month 1.25GB         |
    #|      $ 20 /month 2.5GB          |
    #|      $ 30 /month 4GB            |
    #|      $ 30 /month 4GB            |
    #|      $ 30 /month 2GB            |
    #|      $ 55 /month 8GB            |
    #|      $ 45 /month 8GB            |
    #|      $ 65 /month 12GB           |
    When I follow "Cancel"
    Then I am directed to My addons page
    And I logout

@addondeeplink
Scenario: Check the deep links for Data Addons
Given I open the add ons deep link page
When I log in with a valid msisdn with "postpay_addons_simple"
Then I should see Monthly Data addon title
And I logout
