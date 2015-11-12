@usage
Feature: View my usage details
  As a customer
  I want to navigate to usage details
  So that I can view my detailed usage

@data_depending1 
Scenario: Display message when no usage was incurred on a day
Given I open e2e WSS login page
When I log in with a valid msisdn with "postpay_usage"
When I follow All Usage link
Then I should be informed I had no usage for "today"
And I capture a screenshot
And I logout

@data_depending2 
Scenario: Display usage when user has Talk, Text and Other usage for the last two days
Given I open e2e WSS login page
When I log in with a valid msisdn with "postpay_usage"
When I follow All Usage link
Then I press the more usage button if I have 6 and more days of my billing DOM for "postpay_usage"
Then I should not be informed I had "light" usage for "day_before_billing_dom" for "postpay_usage" 
And I capture a screenshot
Then I should be informed I had "light" usage for "yesterday" for "postpay_usage"
And I capture a screenshot
Then I choose to expand all groups for "yesterday"
And I capture a screenshot
# And I should be informed I had "light" call details for "yesterday"
And I choose to contract all groups for "yesterday"
And I capture a screenshot
And I logout

Scenario: Display usage for unbilled billing cycle
Given I open e2e WSS login page
When I log in with a valid msisdn with "postpay_usage"
When I follow All Usage link
Then I press the more usage button if I have 6 and more days of my billing DOM for "postpay_usage"
And I capture a screenshot
And I logout

Scenario: Display filtered usage for unbilled billing cycle
Given I open e2e WSS login page
When I log in with a valid msisdn with "postpay_usage"
When I follow All Usage link
And I filter usage by "voice"
And I filter usage by "data"
Then I should not be informed I had "voice" usage
And I should not be informed I had "data" usage
And I should be informed I had "text" usage
And I should be informed I had "other" usage
And I capture a screenshot
And I logout

Scenario: Display only extra charges usage
Given I open e2e WSS login page
When I log in with a valid msisdn with "postpay_usage"
When I follow All Usage link
And I follow Show charged items link
And I capture a screenshot
Then I should see Show charged items page title
Then I should see Show all usage link
And I capture a screenshot
And I follow Show all usage link
And I capture a screenshot
Then I should see Show all usage page title
Then I should see Show charged items link
And I logout
