@orpc
Feature: As a marketing member,I want to change plan to recommended planID
As a postpaid customer
I want to be able to change my plan to the recommended plan

Scenario: Postpay user should be able to submit a rate plan change request using "/change_rate_plan" link
Given I open the rate plan change deep link page using "/change_rate_plan"
    When I log in with a valid msisdn with "postpay_simple"
    Then I should see current Plan details on the page
    And I logout

Scenario: Postpay user should be able to submit a rate plan change request using "/change_rate_plan" link
Given I open the rate plan change deep link page using "/change_rate_plan?recommended_plan=AU11124"
    When I log in with a valid msisdn with "postpay_simple"
    Then I should see Compare plans page with the recomended plan "AU11124" as highlighted
    And I logout

Scenario: Prepay user should not be able to use the marketing links for plan change
Given I open the rate plan change deep link page using "/change_rate_plan?recommended_plan=AU10854"
When I log in with a valid msisdn with "prepay_voice"
Then I should see an error page with a proper message
And I logout   