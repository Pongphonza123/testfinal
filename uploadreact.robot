*** Settings ***
Documentation     Test Suite for Uploading an Image
Library           SeleniumLibrary
 
*** Variables ***
${USER}           admin
${PASS}           123456
${URL}            http://203.158.141.62/mainpage  # URL ของหน้าเว็บที่ต้องการทดสอบ
${BROWSER}        chrome
${IMAGE_PATH}     "C:\\Users\\pongp\\Pictures\\Saved Pictures\\test101.jpg"  # Path ของรูปภาพที่ต้องการอัพโหลด (แก้ไขตาม Path ของเครื่องคุณ)
 
*** Test Cases ***
Upload Image Test
    [Documentation]    ทดสอบการอัพโหลดรูปภาพผ่านหน้าเว็บ
    [Tags]             smoke
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
 
    # รอให้องค์ประกอบ upload-box ปรากฏ
    Wait Until Element Is Visible    id=upload-box    timeout=10s
    Click Element                    id=upload-box
    Choose File                      xpath=//input[@type='file']    ${IMAGE_PATH}
   
    # รอให้ปุ่ม predict-button ปรากฏหลังจากอัปโหลดไฟล์
    Wait Until Element Is Visible    id=predict-button    timeout=10s
    Click Element                    id=predict-button
   
    Log    "Image upload was successful"
   
    # ปิดเบราว์เซอร์หลังจากทดสอบเสร็จสิ้น
    Close Browser
 
Dara Test
    [Documentation]    ทดสอบหน้าแสดงผลดารา-อายุ
    [Tags]             smoke
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
 
    # รอให้องค์ประกอบ upload-box ปรากฏ
    Wait Until Element Is Visible    id=upload-box    timeout=10s
    Click Element                    id=upload-box
 
    # อัปโหลดไฟล์ไปยัง input element ที่ซ่อนอยู่
    Choose File        xpath=//input[@type='file']    ${IMAGE_PATH}
 
    # รอให้ปุ่ม predict-button ปรากฏหลังจากอัปโหลดไฟล์
    Wait Until Element Is Visible    id=predict-button    timeout=10s
    Click Element    id=predict-button
 
    Wait Until Element Is Visible    id=predict-dara-button    timeout=10s
    Click Element    id=predict-dara-button
 
    Wait Until Element Is Visible    id=back-button    timeout=10s
    Click Element    id=back-button
 
        Wait Until Element Is Visible    id=predict-age-button    timeout=10s
    Click Element    id=predict-age-button
 
    sleep    10s
    Log    "Check Done"
    Close Browser