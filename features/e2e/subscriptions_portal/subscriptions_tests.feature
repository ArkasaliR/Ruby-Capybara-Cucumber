@Subscription
Feature: As a new Vodafone red plan customer i should be able to view and subscribe to fairfax/spotify subscriptions 
  As a postpay customer
  I want to log in to Subscriptions portal
  So I can view and subscribe to my preferred subscription (Fairfax/Spotify/STAN)

  Scenario: Customers can view fairfax and spotify subscriptions with six months eligibility
  Given I open subscriptions login page
  When I log in with a subscription msisdn with "subscription_sixmonths"
  Then I should see the subscription selection page
  And I capture a screenshot
  When I select fairfax subscription
  Then I should see fairfax landing page with "6 months" option
  When I select choose different offer option
  And I capture a screenshot
  Then I should see the subscription selection page
  When I select spotify subscription
  And I capture a screenshot
  Then I should see spotify landing page with "5 months" option

  Scenario: Customers can view fairfax and spotify subscriptions with twelve months eligibility
  Given I open subscriptions login page
  When I log in with a subscription msisdn with "subscription_twelvemonths"
  Then I should see the subscription selection page
  And I capture a screenshot
  When I select fairfax subscription
  Then I should see fairfax landing page with "6 months" option
  And I capture a screenshot
  When I select choose different offer option
  Then I should see the subscription selection page
  When I select spotify subscription
  And I capture a screenshot
  Then I should see spotify landing page with "11.99 per month" option

  Scenario: Customers can view spotify and STAN subscriptions with six months eligibility
  Given I open subscriptions login page
  When I log in with a subscription msisdn with "subscription_sixmonths"
  Then I should see the subscription selection page
  And I capture a screenshot
  When I select spotify subscription
  Then I should see spotify landing page with "5 months" option
  When I select choose different offer option
  And I capture a screenshot
  Then I should see the subscription selection page
  When I select STAN subscription
  And I capture a screenshot
  Then I should see STAN landing page with "6 months" option

  Scenario: Customers can view spotify and STAN subscriptions with twelve months eligibility
  Given I open subscriptions login page
  When I log in with a subscription msisdn with "subscription_sixmonths"
  Then I should see the subscription selection page
  When I select spotify subscription
  And I capture a screenshot
  Then I should see spotify landing page with "5 months" option
  And I capture a screenshot
  When I select choose different offer option
  Then I should see the subscription selection page
  When I select STAN subscription
  And I capture a screenshot
  Then I should see STAN landing page with "6 months!" option

  Scenario: Customers can view STAN and fairfax subscriptions with six months eligibility
  Given I open subscriptions login page
  When I log in with a subscription msisdn with "subscription_sixmonths"
  Then I should see the subscription selection page
  And I capture a screenshot
  When I select STAN subscription
  Then I should see STAN landing page with "6 months" option
  And I capture a screenshot
  When I select choose different offer option
  Then I should see the subscription selection page
  When I select fairfax subscription
  And I capture a screenshot
  Then I should see fairfax landing page with "6 months" option

 Scenario: Customers can view STAN and fairfax subscriptions with twelve months eligibility
  Given I open subscriptions login page
 When I log in with a subscription msisdn with "subscription_twelvemonths"
 Then I should see the subscription selection page
  And I capture a screenshot
  When I select STAN subscription
  Then I should see STAN landing page with "6 months" option
  And I capture a screenshot
  When I select choose different offer option
  Then I should see the subscription selection page
  When I select fairfax subscription
  And I capture a screenshot
  Then I should see fairfax landing page with "6 months" option

  Scenario: Customers who are not eligible for Spotify/Fairfax must get appropriate error message
  Given I open subscriptions login page
  When I log in with a invalid subscription msisdn with "subscription_ineligible"
  And I capture a screenshot
  Then I should see the subscription ineligible page
  And I capture a screenshot

  Scenario: Customers who have activated Spotify/Fairfax must get appropriate error message
  Given I open subscriptions login page
  When I log in with a invalid subscription msisdn with "subscription_activated"
  And I capture a screenshot
  Then I should see the subscription activated page
  And I capture a screenshot

  Scenario: Customers can reach Fairfax website page
  Given I open subscriptions login page
  When I log in with a subscription msisdn with "subscription_sixmonths"
  Then I should see the subscription selection page
  And I capture a screenshot
  When I select fairfax subscription
  Then I should see fairfax landing page with "6 months" option
  And I capture a screenshot
  Then I verify Fairfax termsandconditions
  Then I check the terms and conditions page and Click on Get fairfax button
  Then I should see Fairfax website registration page
  And I capture a screenshot

  Scenario: Customers can reach Spotify website page
  Given I open subscriptions login page
  When I log in with a subscription msisdn with "subscription_sixmonths"
  When I select choose different offer option
  And I capture a screenshot
  Then I should see the subscription selection page
  When I select spotify subscription
  Then I should see spotify landing page with "5 months" option
  And I capture a screenshot
  Then I verify Spotify termsandconditions
  Then I check the terms and conditions page and Click on Get Get Spotify Premium button
  Then I should see Spotify Premium website registration page
  And I capture a screenshot

  Scenario: Customers can reach STAN website page
  Given I open subscriptions login page
  When I log in with a subscription msisdn with "subscription_sixmonths"
  When I select choose different offer option 
  And I capture a screenshot
  Then I should see the subscription selection page
  When I select STAN subscription
  Then I should see STAN landing page with "6 months" option
  And I capture a screenshot
  Then I verify Stan termsandconditions
  Then I check the terms and conditions page and Click on Get Stan button
  Then I should see STAN website registration page
  And I capture a screenshot
