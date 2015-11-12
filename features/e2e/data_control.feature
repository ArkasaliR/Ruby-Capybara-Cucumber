@cvt
@weblock
 Feature: weblock data barring and debarring
 As a tester
  I want to log in to My Vodafone
  So that I can bar and unbar data usage of sharing accounts
@weblock
Scenario: As a postpay sharing customer I want to view all the shared accounts in single page
Given I open e2e WSS login page
When I log in with a valid msisdn for new AAA with "postpay_complex_sharing"
And I navigate to the Account Settings page
And I capture a screenshot
And I navigate to Data Control
And I capture a screenshot
And I enter a valid pin and submit
Then I should see all my shared accounts under Myservice and Otherservice label
And I capture a screenshot
And I logout

#WIP
#Scenario: As a postpay sharing customer I want to block and unblock data uasge of shared msisdns.
#Given I open e2e WSS login page
#When I log in with a valid msisdn for new AAA with "postpay_complex_sharing"
#And I directed to My usage page
#And I capture a screenshot
#And I navigate to the Account Settings page
#And I navigate to Data Control
#And I enter a valid pin and submit
#Then I should see all my shared accounts under Myservice and Otherservice label
#And I capture a screenshot
#When I click the data control link of parent msisdn
#And I capture a screenshot
#Then I should see the selected msisdn
#Then I should see the blocked data status and the toggle to unblock
#When I toggle the data_control setting to active
#And I capture a screenshot
#And I click the save button to update weblock setting
#And I capture a screenshot
#Then I should see the success message for weblock update
#And I capture a screenshot
#And I return to My usage page
#And I capture a screenshot
#And I logout

#WIP
#Scenario: As a postpay sharing customer I want to block and unblock data uasge of previously changed shared msisdns.
#Given I open e2e WSS login page
#When I log in with a valid msisdn for new AAA with "postpay_complex_sharing"
#And I directed to My usage page
#And I capture a screenshot
#And I navigate to the Account Settings page
#And I navigate to Data Control
#And I enter a valid pin and submit
#Then I should see all my shared accounts under Myservice and Otherservice label
#And I capture a screenshot
#When I click the data control link of parent msisdn
#And I capture a screenshot
#Then I should see the selected msisdn
#Then I should see the active data status and the toggle to block
#When I toggle the data_control setting to blocked
#And I capture a screenshot
#And I click the save button to update weblock setting
#And I capture a screenshot
#Then I should see the success message for weblock update
#And I capture a screenshot
#And I return to My usage page
#And I logout

Scenario: As a postpay sharing customer I want to check How to switch data on or off through My Vodafone help and support link
Given I open e2e WSS login page
When I log in with a valid msisdn for new AAA with "postpay_complex_sharing"
And I directed to My usage page
And I capture a screenshot
And I navigate to the Account Settings page
And I navigate to Data Control
And I enter a valid pin and submit
Then I should see all my shared accounts under Myservice and Otherservice label
And I capture a screenshot
And I click the first help and support link
And I capture a screenshot
And I hit the browser back button
And I capture a screenshot
And I logout

Scenario: As a postpay sharing customer I want to check Manage data usage on your phone help and support link
Given I open e2e WSS login page
When I log in with a valid msisdn for new AAA with "postpay_complex_sharing"
And I directed to My usage page
And I capture a screenshot
And I navigate to the Account Settings page
And I navigate to Data Control
And I enter a valid pin and submit
Then I should see all my shared accounts under Myservice and Otherservice label
And I capture a screenshot
When I click the data control link of parent msisdn
And I capture a screenshot
Then I should see the selected msisdn
And I click the second help and support link
And I capture a screenshot
And I hit the browser back button
And I capture a screenshot
And I logout

Scenario: As a postpay sharing customer I want to check How to turn data roaming on or off help and support link
Given I open e2e WSS login page
When I log in with a valid msisdn for new AAA with "postpay_complex_sharing"
And I directed to My usage page
And I capture a screenshot
And I navigate to the Account Settings page
And I navigate to Data Control
And I enter a valid pin and submit
Then I should see all my shared accounts under Myservice and Otherservice label
And I capture a screenshot
And I click the third help and support link
And I capture a screenshot
And I hit the browser back button
And I capture a screenshot
And I logout

Scenario: As a postpay sharing customer I want to check Why isn’t my internet working? help and support link
Given I open e2e WSS login page
When I log in with a valid msisdn for new AAA with "postpay_complex_sharing"
And I directed to My usage page
And I capture a screenshot
And I navigate to the Account Settings page
And I navigate to Data Control
And I enter a valid pin and submit
Then I should see all my shared accounts under Myservice and Otherservice label
And I capture a screenshot
When I click the data control link of parent msisdn
And I capture a screenshot
Then I should see the selected msisdn
And I click the fourth help and support link
And I capture a screenshot
And I hit the browser back button
And I capture a screenshot
And I logout

Scenario: As a postpay non-sharing customer I want check the error scenarios
Given I open e2e WSS login page
When I log in with a valid msisdn for new AAA with "postpay_complex"
And I navigate to the Account Settings page
Then I shouldn't see Data Control in Account Settings
And I capture a screenshot
And I am directed to My usage page
Then I shouldn't see Data Control Quick Link in My usage
And I capture a screenshot
And I am directed to My usage page
And I capture a screenshot
And I logout


Scenario: As a prepay customer I want check the error scenarios
Given I open e2e WSS login page
When I log in with a valid msisdn for new AAA with "prepay_voice"
And I am directed to My usage page
Then I shouldn't see Data Control Button
And I capture a screenshot
And I logout
