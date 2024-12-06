*** Settings ***
Library    AppiumLibrary


*** Test Cases ***

TEST

#   Open Application    http://172.20.10.2:4723    platformName=Android     deviceName=emulator-5554    automationName=UiAutomator2

    Open Application	http://localhost:4723	alias=MyApp    platformName=Android    platformVersion=15	deviceName=emulator-5554    appPackage=io.ionic.starter   automationName=UiAutomator2
