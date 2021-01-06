*** Settings ***
Documentation     Ecommerce Training Demo Page
Library           SeleniumLibrary
Test Teardown     Close Browser
Suite Teardown    Suite Shutdown

*** Variables ***
${URL}        https://webscraper.io/test-sites/e-commerce/more/computers/tablets
${BROWSER}    chrome

*** Test Cases ***	
Exercise 1
	[Tags]    run
	Given I visit a training site and go to tablets page
	Then I navigate to the first computer tablet

Exercise 2
	[Tags]    no-run
	Given I visit a training site and go to tablets page
	Then I navigate to the first computer tablet
	Then I navigate to laptops page

*** Keywords ***
Given I visit a training site and go to tablets page
	Open Browser	${URL}	${BROWSER}
	Maximize Browser Window
	
Suite Shutdown
    Close All Browsers

Then I navigate to the first computer tablet
    # Try this out
	# Identify the elements/links that you would click 

Then I navigate to laptops page
    # Try this out
	# Identify the elements/links that you would click

