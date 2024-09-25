*** Settings ***
Resource    ${CURDIR}/../../Import/Import.robot    # robotcode: ignore
Suite Setup    Common_feature.KEYWORD_COMMON_FETURE (GET DATA FROM JSON)    json_file=${json_file}[API]   

*** Variables ***
${LOGIN}                login
${ADDUSER}              adduser
${UPDATE_USER}          updateprofile
${ALL_ACCOUNT}          allaccount
${ACCOUNT}              account
${ALL_BANKS}            allbanks
${ALL_DEVICE}           alldevice
${ADD_DEVICE}           adddevice
${DEVICE}               device
${UPDATE_NAME_DEVICE}   updatenamedevice
${REMOVE_DEVICE}        removedevice
${TRANSFER_RECORD}      tranferrecord
${TRANSFER_RECORD_BY_ID}    tranferrecordbyid
${ALL_TRANSFER}         alltranfer
${TRANSFER}             tranfer
${DEPOSIT}              deposit
${WITHDRAW}             withdraw
${ALL_REPORT}           allreport
${PER_DAY_REPORT}       perdayreport
${PER_WEEK_REPORT}      perweekreport
${REMOVE_USER}          removeuser


*** Test cases ***
TC_01 - login
    [Documentation]    Test the login functionality.
    [Tags]    TC_01
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${LOGIN}

TC_02 - register
    [Documentation]    Test the user registration functionality.
    [Tags]    TC_02
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${ADDUSER}

TC_03 - update user
    [Documentation]    Test the update user profile functionality.
    [Tags]    TC_03
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${UPDATE_USER}

TC_04 - all accounts
    [Documentation]    Test retrieving all accounts functionality.
    [Tags]    TC_04
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${ALL_ACCOUNT}

TC_05 - account
    [Documentation]    Test retrieving a specific account functionality.
    [Tags]    TC_05
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${ACCOUNT}

TC_06 - all banks
    [Documentation]    Test retrieving all banks functionality.
    [Tags]    TC_06
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${ALL_BANKS}

TC_07 - all devices
    [Documentation]    Test retrieving all devices functionality.
    [Tags]    TC_07
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${ALL_DEVICE}

TC_08 - add device
    [Documentation]    Test adding a new device functionality.
    [Tags]    TC_08
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${ADD_DEVICE}

TC_09 - device
    [Documentation]    Test retrieving a specific device functionality.
    [Tags]    TC_09
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${DEVICE}

TC_10 - update device name
    [Documentation]    Test updating device name functionality.
    [Tags]    TC_10
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${UPDATE_NAME_DEVICE}

TC_11 - remove device
    [Documentation]    Test removing a device functionality.
    [Tags]    TC_11
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${REMOVE_DEVICE}

TC_12 - transfer record
    [Documentation]    Test transferring records functionality.
    [Tags]    TC_12
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${TRANSFER_RECORD}

TC_13 - transfer record by ID
    [Documentation]    Test transferring records by ID functionality.
    [Tags]    TC_13
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${TRANSFER_RECORD_BY_ID}

TC_14 - all transfers
    [Documentation]    Test retrieving all transfers functionality.
    [Tags]    TC_14
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${ALL_TRANSFER}

TC_15 - transfer
    [Documentation]    Test transfer functionality.
    [Tags]    TC_15
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${TRANSFER}

TC_16 - deposit
    [Documentation]    Test deposit functionality.
    [Tags]    TC_16
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${DEPOSIT}

TC_17 - withdraw
    [Documentation]    Test withdraw functionality.
    [Tags]    TC_17
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${WITHDRAW}

TC_18 - all reports
    [Documentation]    Test retrieving all reports functionality.
    [Tags]    TC_18
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${ALL_REPORT}

TC_19 - per day report
    [Documentation]    Test retrieving per day report functionality.
    [Tags]    TC_19
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${PER_DAY_REPORT}

TC_20 - per week report
    [Documentation]    Test retrieving per week report functionality.
    [Tags]    TC_20
    Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${PER_WEEK_REPORT}

# TC_21 - remove user
#     [Documentation]    Test removing user functionality.
#     [Tags]    TC_21
#     Common_feature.KEYWORD_COMMON_FETURE (READ DATA BY JSON) ADMIN PAGE  ${REMOVE_USER}
