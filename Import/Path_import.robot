*** Settings ***

Library    SeleniumLibrary
Library    Collections
Library    String
Library    DateTime
Library    JSONLibrary
Library    RequestsLibrary
Library    ${CURDIR}/../Resources/Library/Excel_reader.py    
Library    ${CURDIR}/../Resources/Library/Json_reader.py    

# Commonkeyword
Resource    ${CURDIR}/../Keyword/Common_keyword.robot    # robotcode: ignore

# Excel
Resource    ${CURDIR}/../Keyword/Excel_reader/Excel_reader.robot   # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Json_reader/Json_reader.robot   # robotcode: ignore

# Feture
Resource    ${CURDIR}/../Keyword/Feature/Common_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Login_feature/Login_feature.robot    # robotcode: ignore

# Page 
Resource    ${CURDIR}/../Keyword/Page/Login_page/Login_page.robot    # robotcode: ignore

# Capture 
Resource    ${CURDIR}/../Keyword/Capture_screen.robot    # robotcode: ignore

# Locator
Resource    ${CURDIR}/../Locator/Common_locator.robot    # robotcode: ignore
Resource    ${CURDIR}/../Locator/Login_locator/Login_locator.robot    # robotcode: ignore

# yaml
Variables    ${CURDIR}/../Resources/Settings/Setting.yaml    # robotcode: ignore

