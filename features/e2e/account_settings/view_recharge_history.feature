@recharge_history
Feature: As a Prepaid Vodafone user I want to view my recharge history

Scenario: Prepay customers can view recharge history via the link in the account settings page
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "prepay_voice"  
  And I navigate to the Account Settings page
  Then I capture a screenshot
  Then I should see the recharge history link
  Then I click on the recharge history link
  And I logout

  Scenario: Prepay customers can view recharge history via Quick links in My usage page 
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "prepay_voice"
  Then I capture a screenshot
  Then I should see the recharge history link under Quick links in My usage page
  Then I click on the recharge history link
  And I logout

  Scenario: Prepay customers can view recharge history the link in the REcharge now page
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "prepay_voice"
  Then I click on Recharge button in the My usage page
  Then I capture a screenshot
  Then I should see the recharge history link
  Then I click on the recharge history link
  And I logout

  Scenario: Prepay customers can view and verify the recharge history page
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "prepay_voice"
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