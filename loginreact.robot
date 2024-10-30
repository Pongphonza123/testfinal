*** Settings ***
Documentation     Test Suite for Valid Login Test
Library           SeleniumLibrary

*** Variables ***
${USER}            admin
${PASS}            123456
${URL}             http://203.158.141.62/mainpage  # ใส่โปรโตคอล http ให้ครบ
${BROWSER}         chrome

*** Test Cases ***
Valid Login Test
    [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ถูกต้อง
    [Tags]             smoke
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    
    # รอให้องค์ประกอบฟอร์ม login ปรากฏ
    Wait Until Element Is Visible    id=username    timeout=10s
    Input Text                       id=username    ${USER}
    
    Wait Until Element Is Visible    id=password    timeout=10s
    Input Text                       id=password    ${PASS}

    Wait Until Element Is Visible    id=login-button    timeout=10s
    Click Element                    id=login-button

    # ตรวจสอบว่าการ login สำเร็จโดยการรอ element ที่คาดว่าจะปรากฏหลัง login
    Wait Until Page Contains Element    id=welcome-message    timeout=10s
    Log    "Login was successful"
    
    Close Browser
