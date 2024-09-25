*** Settings ***
Library    String
Library    collections

*** Test Cases ***

Extract Digits Between Oness

    ${input}    BuiltIn.Set Variable    88979878912545454545454515645
    ${first_index}    BuiltIn.Evaluate    "${input}".find('1')
    ${last_index}     BuiltIn.Evaluate    "${input}".rfind('1')
    ${result}    BuiltIn.Evaluate    "${input}"[${first_index}+1:${last_index}]
    ${length}    BuiltIn.Get Length    ${result}
    BuiltIn.Log    ${result}    WARN
    BuiltIn.Log    Length: ${length}    WARN

