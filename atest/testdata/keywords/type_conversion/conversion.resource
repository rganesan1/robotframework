*** Keywords ***
Conversion Should Fail
    [Arguments]    ${kw}    @{args}    ${type}=${kw.lower()}    &{kwargs}
    ${error} =    Run Keyword And Expect Error    *    ${kw}    @{args}    &{kwargs}
    ${arg} =    Evaluate    (list($args) + list($kwargs.values()))[0]
    Should Be Equal    ${error}
    ...    ValueError: Argument 'argument' cannot be converted to ${type}, got '${arg}'.

Non-string is not converted
    [Arguments]    ${kw}
    Run Keyword    ${kw}    ${1}       ${1}
    Run Keyword    ${kw}    ${1.5}     ${1.5}
    Run Keyword    ${kw}    ${True}    ${True}
    Run Keyword    ${kw}    ${None}    ${None}
    Run Keyword    ${kw}    ${LIST}    ${LIST}
    Run Keyword    ${kw}    ${DICT}    ${DICT}

String None is converted to None object
    [Arguments]    ${kw}
    Run Keyword    ${kw}    None       ${None}
    Run Keyword    ${kw}    NONE       ${None}
    Run Keyword    ${kw}    none       ${None}
