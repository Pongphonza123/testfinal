*** Settings ***
Documentation     Login Test Suite
Library           AppiumLibrary
 
*** Variables ***
${URL}                        http://127.0.0.1:4723
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   15
${ANDROID_APP}                C:\\Users\\User\\AndroidStudioProjects\\Whoareyou\\app\\build\\outputs\\apk\\debug\\app-debug.apk
${APP_PACKAGE}                com.example.whoareyou


${ALLOW_BTN}                 id=${APP_PACKAGE}:id/allow_button     #อนุญาติให้เข้าถึง
${DENY_BTN}                  id=${APP_PACKAGE}:id/deny_button      #ปฏิเสธการเข้าถึง
${ALLOW BUTTON ONLYTHIS}     id=com.android.permissioncontroller:id/permission_allow_foreground_only_button  #permission androidอนุญาติขณะใช้เเอพ
${ALLOW BUTTON ONETIME}      id=com.android.permissioncontroller:id/permission_allow_one_time_button         #permission androidอนุญาติครั้งนี้
${DONT ALLOW BUTTON }        id=com.android.permissioncontroller:id/permission_deny_button                   #permission androidไม่อนุญาติ
${UPLOAD_IMAGE_ICON}         id=${APP_PACKAGE}:id/addphoto             #ปุ่มเลือกรูป
${TAKE_PHOTO}                id=android:id/text1                        #ใช้กล่องถ่าย
${CHOOSE_FROM_GALLERRY}      //android.widget.TextView[@text='Choose from Gallery']   #เลือกรูปจากเเกลเลอรี่
${PICTURE_GALLERRY}          //android.widget.TextView[@text='Pictures']   #เลือกgalleryรูป
${PICTURE_1}                 //android.widget.ImageView[@content-desc='Photo taken on Oct 23, 2024 9:00 PM']
${CANCEL_OPTION}             //android.widget.TextView[@text='Cancel']        #ยกเลิก
${CAPTURE_BTN}               id=com.android.camera2:id/shutter_button  #ปุ่มกดถ่ายรูป
${CONFIRM_BTN}               id=com.android.camera2:id/done_button     #ปุ่มยืนยันการถ่ายรูป
${retake_BTN}                id=com.android.camera2:id/retake_button   #ปุ่มย้อนกลับ
${CONFIRM_BTN}               id=com.android.camera2:id/cancel_button   #ปุ่มเลิกการถ่ายรูป
${SUBMIT_BTN}                id=com.android.camera2:id/done_button     #ปุ่มยืนยันหลังจากการอัปโหลดรูป
${AGE_PREDICTION_BTN}        id=${APP_PACKAGE}:id/buttonage            #ปุ่มทำนายอายุ
${COMPARE_CELEB_BTN}         id=${APP_PACKAGE}:id/buttonstar           #ปุ่มเปรียบเทียบความเหมือนดารา

*** Test Cases ***

Valid test
    [Documentation]    ทดสอบการอัปโหลดรูปโดยการถ่ายรูป 
    [tags]             smoke
    Open Test Application    
    Click Element                    id=${APP_PACKAGE}:id/playButton
    Wait Until Element Is Visible    id=${APP_PACKAGE}:id/main    timeout=30s
    Click Element                    id=${APP_PACKAGE}:id/allow_button
    Wait Until Element Is Visible    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button        timeout=30s
    Click Element                    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Element Is Visible    id=${APP_PACKAGE}:id/addphoto    timeout=30s
    Click Element                    id=${APP_PACKAGE}:id/addphoto
    Wait Until Element Is Visible    id=android:id/text1        timeout=30s
    Click Element                    id=android:id/text1
    Wait Until Element Is Visible    id=com.android.camera2:id/shutter_button    timeout=30s
    Click Element                    id=com.android.camera2:id/shutter_button
    Wait Until Element Is Visible    id=com.android.camera2:id/done_button    timeout=30s
    Click Element                    id=com.android.camera2:id/done_button
    Wait Until Element Is Visible    id=${APP_PACKAGE}:id/addphoto    timeout=30s
    Close Application



Valid test Gallery
    [Documentation]    ทดสอบการเลือกรูปจากgallery
    [tags]             smoke
    Open Test Application    
    Click Element                    id=${APP_PACKAGE}:id/playButton
    Wait Until Element Is Visible    id=${APP_PACKAGE}:id/main    timeout=30s
    Click Element                    id=${APP_PACKAGE}:id/allow_button
    Wait Until Element Is Visible    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button        timeout=30s
    Click Element                    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Element Is Visible    id=${APP_PACKAGE}:id/addphoto    timeout=30s
    Click Element                    id=${APP_PACKAGE}:id/addphoto
    Wait Until Element Is Visible    id=android:id/text1        timeout=30s
    Click Element                    //android.widget.TextView[@text='Choose from Gallery']
    Wait Until Element Is Visible    //android.widget.TextView[@text='Pictures']
    Click Element                    //android.widget.TextView[@text='Pictures']
    Wait Until Element Is Visible    xpath=(//android.widget.ImageView)[1]    timeout=30s
    Click Element                    xpath=(//android.widget.ImageView)[1]
    Wait Until Element Is Visible    id=${APP_PACKAGE}:id/addphoto    timeout=30s
    Close Application


 

 Valid age
    [Documentation]    ทดสอบการทำนายอายุ 
    [tags]             smoke
    Open Test Application  
    Upload Image
    Click Element                   id=${APP_PACKAGE}:id/confirmButton
    Wait Until Element Is Visible   id=${APP_PACKAGE}:id/buttonage    timeout=30s
    Click Element                   id=${APP_PACKAGE}:id/buttonage 
    Wait Until Element Is Visible   id=${APP_PACKAGE}:id/buttonback

Valid celebrity
    [Documentation]    ทดสอบการเปรียบเทียบความเหมือนกับดารา 
    [tags]             smoke
    Open Test Application  
    Upload Image
    Click Element                   id=${APP_PACKAGE}:id/confirmButton
    Wait Until Element Is Visible   id=${APP_PACKAGE}:id/buttonstar    timeout=30s
    Click Element                   id=${APP_PACKAGE}:id/buttonstar 
    Wait Until Element Is Visible   id=${APP_PACKAGE}:id/deny_button

*** Keywords ***
Open Test Application
  Open Application    ${URL}    automationName=${ANDROID_AUTOMATION_NAME}   platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  app=${ANDROID_APP}

Upload Image
    Click Element                   id=${APP_PACKAGE}:id/playButton
    Wait Until Element Is Visible   id=${APP_PACKAGE}:id/main    timeout=30s
    Click Element                   id=${APP_PACKAGE}:id/allow_button
    Wait Until Element Is Visible   id=com.android.permissioncontroller:id/permission_allow_foreground_only_button        timeout=30s
    Click Element                   id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Element Is Visible   id=${APP_PACKAGE}:id/addphoto    timeout=30s
    Click Element                   id=${APP_PACKAGE}:id/addphoto
    Wait Until Element Is Visible   id=android:id/text1        timeout=30s
    Click Element                   id=android:id/text1
    Wait Until Element Is Visible   id=com.android.camera2:id/shutter_button    timeout=30s
    Click Element                   id=com.android.camera2:id/shutter_button
    Wait Until Element Is Visible   id=com.android.camera2:id/done_button    timeout=30s
    Click Element                   id=com.android.camera2:id/done_button
    Wait Until Element Is Visible   id=${APP_PACKAGE}:id/addphoto    timeout=30s