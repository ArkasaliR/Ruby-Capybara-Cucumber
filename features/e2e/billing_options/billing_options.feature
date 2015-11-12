@billingoptions
Feature: As a Vodafone customer i should be able to view and edit my billing options so that i can manage my bills accordingly 
  As a postpay customer
  I want to log in to my vodafone
  So I can view and edit my billing options to better manage my bills

   Scenario: Customers can view and edit bill presentation options to not show call details
   Given I open e2e WSS login page
   When I log in with a valid msisdn with "postpay_simple"
   And I navigate to the Billing Options page
   And I edit the Billing presentation options to not show call details
   And I save the option
   Then I should see a Success page
   And I navigate to the Billing Options page
   Then I should see the Billing options set to not show call details
   And I logout

   Scenario: Customers can view and edit bill presentation options to show call details
   Given I open e2e WSS login page
   When I log in with a valid msisdn with "postpay_simple"
   And I navigate to the Billing Options page
   And I edit the Billing presentation options to show call details
   And I save the option
   Then I should see a Success page
   And I navigate to the Billing Options page
   Then I should see the Billing options set to show call details
   And I logout 

   Scenario: Customers can view and edit bill delivery options
   Given I open e2e WSS login page
   When I log in with a valid msisdn with "postpay_simple"
   And I navigate to the Billing Options page
   And I edit the Billing delivery options to paperless
   Then I should see "Email bill to"
   And I should not see "Email me"
   And I edit the Billing delivery options to paper billing option
   Then I should not see "Email bill to"
   And I should see "Email me"
   And I logout 
      
   Scenario: Customers can view and edit bill notifications options
   Given I open e2e WSS login page
   When I log in with a valid msisdn with "postpay_simple"
   And I navigate to the Billing Options page
   And I edit the Billing notifications options to TXT
   And I save the option
   Then I should see a Success page
   And I navigate to the Billing Options page
   Then I should see the Billing notifications set to TXT
   And I logout

   Scenario: Customers can view and edit bill notifications options
   Given I open e2e WSS login page
   When I log in with a valid msisdn with "postpay_simple"
   And I navigate to the Billing Options page
   And I edit the Billing notifications options to Email
   And I save the option
   Then I should see a Success page
   And I navigate to the Billing Options page
   Then I should see the Billing notifications set to Email
   And I logout 



