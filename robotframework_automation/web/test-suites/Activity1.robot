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
	[Tags]    no-run
	Given I visit a training site and go to tablets page
	Then I navigate to the first computer tablet

Exercise 2
	[Tags]    no-run
	Given I visit a training site and go to tablets page
	Then I navigate to the first computer tablet
	Then I navigate to laptops page

*** Keywords ***
Given I visit a training site and go to tablets page
	Open Chrome	 ${URL}

Open Chrome
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    #Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage 
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size  1400  800
    Go To    ${url}


Suite Shutdown
    Close All Browsers
	
Then I navigate to the first computer tablet
	# Try this out
	# Identify the action and elements to click on

Then I navigate to laptops page
	# Try this out
	# Identify the action and elements to click on
