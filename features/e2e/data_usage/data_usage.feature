@datausage
Feature: View my data usage dials
  As a customer
  I want to navigate to data usage details
  So that I can view the amount of data left in my entitlements

@datatest
Scenario: Display the data and the days left as per the entitlements on the Data usage dials 
Given I open e2e WSS login page
When I log in with a valid msisdn with "postpay_usage"
Then I should retrieve my entitlements
When I follow Data Usage link
Then I should see data usage dials
Then data usage dials must match with my entitlements
And I logout


Scenario: Display the data left in the daily breakdown graph
Given I open e2e WSS login page
When I log in with a valid msisdn with "postpay_usage"
When I follow Data Usage link
Then I should see data usage dials
Then I retrieve the data left message
Then I click the dailybreakdown tab
Then the data usage graphs must match the data usage dials
And I logout

@deeplink
Scenario: Check the deep links for Data Usage
Given I open the data usage deep link page
When I log in with a valid msisdn with "postpay_usage"
Then I should see data usage dials
And I logout




