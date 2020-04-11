*** Settings ***
Library    SeleniumLibrary    
#Suite Setup    Log    I'm inside Test Suite Setup
#Suite Teardown    Log    I'm inside Test Suite Teardown    
#Test Setup    Log    I'm inside Test Setup
#Test Teardown    Log    I'm inside Test Teardown
Default Tags    sanity    
        
*** Test Cases ***
MyFirstTest
    Log    Hello World ..    
    
MySecondTest
    [Tags]    smoke
    Log    I'm inside my second test   
    
MyThirdTest
    Log    I'm inside my third test    
    Set Tags    regression 
    Remove Tags    regression
    
FirstSeleniumTest
    Open Browser    https://google.com    chrome    executable_path=/usr/local/bin/chromedriver
    Set Browser Implicit Wait    5
    Input Text    name=q    bridgetek
    Press Keys    name=q    ENTER
    #Click Element    name=btnK    
    Sleep    3       
    Close Browser
    Log    Test Completed..    
    
Sampleloginlogouttest
    [Documentation]    This is a sample login test
    Open Browser    https://brtchip.com/my-account/    chrome    executable_path=/usr/local/bin/chromedriver 
    #Open Browser    https://richmondu.com/    firefox    executable_path=/usr/local/bin/geckodriver
    #Wait Until Element Is Visible    name=input-username    
    Set Browser Implicit Wait    5
    Input Text    id=username    brtiot2020@gmail.com  
    #Input Text    name=input-username    brtiot2020@gmail.com     
    Input Password    id=password    Brt409030
    #Input Password    name=input-password    Brt409030    
    Click Button    name=login
    Sleep    3    
    Click Element    xpath=//*[@id="av_section_1"]/div/div[2]/main/div/div/div[2]/section/div/div/nav/ul/li[6]/a
    Sleep    3
    Close Browser
    Log    Test Completed..    
            
Sampleloginlogouttestusingvariables
    [Documentation]    This is a sample login test
    Open Browser    ${url}    chrome    executable_path=/usr/local/bin/chromedriver 
    #Open Browser    https://richmondu.com/    firefox    executable_path=/usr/local/bin/geckodriver
    #Wait Until Element Is Visible    name=input-username    
    Set Browser Implicit Wait    5
    Input Text    id=username    ${credential}[0]  
    #Input Text    name=input-username    brtiot2020@gmail.com     
    Input Password    id=password    &{logindata}[password]
    #Input Password    name=input-password    Brt409030    
    Click Button    name=login
    Sleep    3    
    Click Element    xpath=//*[@id="av_section_1"]/div/div[2]/main/div/div/div[2]/section/div/div/nav/ul/li[6]/a
    Sleep    3
    Close Browser
    Log    Test Completed..
    
Sampleloginlogouttestusinguserkeywords
    [Documentation]    This is a sample login test
    Open Browser    ${url}    chrome    executable_path=/usr/local/bin/chromedriver 
    #Open Browser    https://richmondu.com/    firefox    executable_path=/usr/local/bin/geckodriver
    #Wait Until Element Is Visible    name=input-username    
    Set Browser Implicit Wait    5
    loginkeys
    Sleep    3    
    Click Element    xpath=//*[@id="av_section_1"]/div/div[2]/main/div/div/div[2]/section/div/div/nav/ul/li[6]/a
    Sleep    3
    Close Browser
    Log    Test Completed..
    
*** Variables ***
${url}    https://brtchip.com/my-account/
@{credential}    brtiot2020@gmail.com    Brt409030
&{logindata}    username=brtiot2020@gmail.com    password=Brt409030

*** Keywords ***
loginkeys
    Input Text    id=username    ${credential}[0]  
    Input Password    id=password    &{logindata}[password]
    Click Button    name=login
    
