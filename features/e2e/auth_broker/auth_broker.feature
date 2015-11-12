@auth_broker
Feature: Auth Broker
  As an eStore 
  I want to save a cookie when a user logged in
  So that I can present useful products 

  Scenario: User logged on to self-service and the vodafone_auth cookie will get create
    Given I open e2e WSS login page
    When I log in with a valid msisdn with "postpay_simple" 
    Then I should see Auth Broker call in the page source code