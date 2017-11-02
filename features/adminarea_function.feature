Feature: Inspect countries, locations, suppliers and suppliers + customers 

	We are Inspect admin area function 

Background:
	Given I go to admin page
	And I login

Scenario: Inspect countries 
	      Given I am on admin page and inspect pagination 
          And I click on Indicator and show buttons 
 

Scenario: Inspect location 
	      Given I am on admin page and inspect pagination of location 
          And I click keyword export

Scenario: Inspect supplier 
          Given I am on admin page and inspect pagination of supplier + cutomer 
          And I search for the supplier and create IM 
          And I click on show button and check duns
          And I edit serch name 

Scenario: Uncleared Status 
          Given I check for uncleared and cleared status of suppliers and customers 
          And Save the Placement report in drop box

@important
Scenario: Validate Indicator Messages 
          Given I check for the all the valid and expiry dates
          And I change the date one of the IM to todays date annd filter it 
         