*** Variables ***
${ACCESS'IBILITY_BUTTON}    accessibility_id=Access'ibility
${ACCESSIBILITY_BUTTON}    accessibility_id=Accessibility
${ANIMATION_BUTTON}    accessibility_id=Animation
${APP_BUTTON}     accessibility_id=App
${CONTENT_BUTTON}    accessibility_id=Content
${GRAPHICS_BUTTON}    accessibility_id=Graphics
${MEDIA_BUTTON}    accessibility_id=Media
${NFC_BUTTON}     accessibility_id=NFC
${OS_BUTTON}      accessibility_id=OS
${PREFERENCE_BUTTON}    accessibility_id=Preference
${TEXT_BUTTON}    accessibility_id=Text
${VIEWS_BUTTON}    accessibility_id=Views
${TITLE}          id=android:id/action_bar

*** Keywords ***
Click Animation Button
    Click Element    ${ANIMATION_BUTTON}

Verify App Started
    Wait Until Page Contains Element    ${TITLE}    timeout=30s
    Page Should Contain Element    ${TITLE}
    Capture Page Screenshot
