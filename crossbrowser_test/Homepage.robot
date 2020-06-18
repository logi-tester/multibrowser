*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${baseurl}        https://www.fsstech.com/

*** Test Cases ***
Browser launch
    Open Browser    ${base_url}    ${BROWSER}
	Maximize Browser Window
    Set Browser Implicit Wait    15s
    Sleep    5s

header menu list and link redirection verification
    ${menu_list}=    Get Element Count    xpath=.//ul[@id='nav']/li
    Should Be True    ${menu_list}>=5

header and footer verification
    Element Should Be Visible    xpath=.//header
    Sleep    4s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Element Should Be Visible    xpath=.//footer

*** Keywords ***
Jenkins browser launch
    Set Selenium Speed    1s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Go To    ${baseurl}
    Maximize Browser Window
    Set Browser Implicit Wait    15s

Local browser launch
    Set Selenium Speed    1s
    Open Browser    ${baseurl}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    15s
