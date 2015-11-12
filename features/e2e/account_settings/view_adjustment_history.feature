@adjustmenthistory
 Feature:  As a vodafone customer
  I want to see my adjustment history

Scenario: As a prepay customers I have access to my adjustment history
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "prepay_voice" 
#   When I log in with a prepay msisdn with 61408105948 
  And I navigate to the Account Settings page
  Then I should see the adjustment history link
  And I logout

Scenario: As a prepay customers I have access to my adjustment history
  Given I open e2e WSS login page
  When I log in with a valid msisdn with "prepay_voice" 
#  When I log in with a prepay msisdn with 61408105948 
  And I navigate to the Account Settings page
  And I click the adjustment history link
  Then I should see adjustment history 
  And I click "View more" button if exist on adjustment history page
  And I should see "For older adjustments please"
  And I should see a link "contact customer care"
  And I logout  