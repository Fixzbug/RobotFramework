*** Settings ***

Library    SeleniumLibrary
Library    Collections
Library    String
Library    DateTime
Library    JSONLibrary
Library    RequestsLibrary
Library    ${CURDIR}/../Resources/Library/Excel_reader.py    
Library    ${CURDIR}/../Resources/Library/Json_reader.py    

Resource    ${CURDIR}/../Keyword/Common_keyword.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Common_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Capture_screen.robot    # robotcode: ignore
Resource    ${CURDIR}/../Locator/Common_locator.robot    # robotcode: ignore
Variables    ${CURDIR}/../Resources/Settings/Setting.yaml    # robotcode: ignore

