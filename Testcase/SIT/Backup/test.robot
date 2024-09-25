*** Settings ***
Library    JSONLibrary
Library    Collections

*** Variables ***
# ${excel_data}    {'TC': 'LB_1', 'LABEL_1': 'Inquiry Customer Request', 'LABEL_2': 'Username: P3207019', 'LABEL_3': 'Branch: 1: SILOM', 'BTN_1': 'Preview Report', 'BTN_2': 'Print Report', 'BTN_3': 'Reset'}
${excel_data}    {"TC": "LB_1", "LABEL_1": "Inquiry Customer Request", "LABEL_2": "Username: P3207019", "LABEL_3": "Branch: 1: SILOM", "BTN_1": "Preview Report", "BTN_2": "Print Report", "BTN_3": "Reset"}

*** Test Cases ***
TEST CASE 1
    ${keys_group}=    Convert String To Json    ${excel_data}
    ${keys_group}=    Get Dictionary Keys    ${keys_group}    # get key to dic
    ${indexed_keys}=    Create Dictionary    # create dic

    ${index}=    Set Variable    0

    FOR   ${key}  IN   ${keys_group}
        ${index_str}=    Convert To String    ${index}
        Set To Dictionary    ${indexed_keys}    ${index_str}    ${key}
        ${index}=    Evaluate    ${index} + 1
    END
    Log    ${indexed_keys}[0]    WARN


TEST CASE 2
    ${json_dict}=    Convert String To Json    ${excel_data}
    ${ordered_dict}=    Evaluate    collections.OrderedDict(${json_dict})
    Log    ${ordered_dict}    WARN
    ${keys_group}=    Get Dictionary Keys    ${ordered_dict}
    Log    ${keys_group}    WARN


TEST CASE 3
    ${json_dict}=    Convert String To Json    ${excel_data}
    ${keys_group}=    Get Dictionary Keys    ${json_dict}    sort_keys=False
    Log    ${keys_group}   WARN


# 0: TC
# 1: UPD_Case
# 2: ID_Number
# 3: Contract_No
# 4: Branch
# 5: Request_Date_From
# 6: Request_Date_To
# 7: Request_Type
# 8: RequestStatus
# 9: Branch_Request
# 10: Branch_Process
# 11: Result_Date_From
# 12: Result_Date_To
# 13: No_Data
# 14: Seq
# 15: Customer
# 16: Contract_No.1
# 17: Req_No
# 18: Type
# 19: Status
# 20: Pending_Code
# 21: Req_Date_Time
# 22: Req_By
# 23: Result_Date_Time
# 24: Result_By
# 25: Req_Branch
# 26: Pending_Day
# 27: Result_By_Interview
# 28: Result_Date_Time2
# 29: Result_By_Kessai
# 30: Old_RCL
# 31: New_RCL
# 32: Old_Salary
# 33: New_Salary
