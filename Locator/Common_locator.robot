*** Variables ***

# Intranet
${URL_Intranet}                         http://intranet/siamac/www/default.aspx?Popup=Y
${btn_SSO}                              //img[@src='../image/Header/icon_sso.png']
${verify_header_locator}                //div[@class='card-header text-center']
${label_verrify_header}                 //label[@id='lbl_HeaderName']
${label_verrify_username}               //label[@id='header_UserName']
${label_verrify_branch}                 //label[@id='header_Brach']

#Browser
${BrowserChrome}                        chrome    
${BrowserEdge}                          Edge  
${BrowserHeadlesschrome}                headlesschrome


# LOGIN User Authentication
${sso_username_text_area}               id=txtUsername
${sso_password_text_area}               //input[@name='password']
${btn_login_on_user_authentication}     //button[@type='submit']

# Portal
${link_system}                          //span[@class='link-primary' and contains(text(),'***replace***')]
${menu_locator}                         //a[contains(.,'***replace***')]
${sub_menu_locator}                     //a[contains(.,'***replace***')]

# txt replace
${txt_replace}                          //td[contains(.,'***replace***')]
${txt_wo_approve_replace}               //td[contains(text(),'***replace***')]
${txt_od_approve_replace}               //td[contains(text(),'***replace***')]
${txt_replace_locator}                  //td[@class='sorting_1']//center

# Verify with replace
${txt_th_replace}                       //th[@scope="col" and contains(text(),'***replace***')]
${txt_td_replace}                       //td[contains(text(),'***replace***')]

# Button
${btn_approve}                          id=ctl00_btnApprove
${btn_back}                             id=ctl00_btnGotoList
${btn_previewReport}                    id=ctl00_btnPreviewReport
${btn_cancel}                           id=ctl00_btnCancel
${btn_search}                           id=ctl00_btnSearch

# sheet name
${type_01}                              01_Waive_PNT
${type_03}                              03_Loss
${type_06}                              06_Nego_WO
${type_09}                              09_Nego_FRAUD

# Error
${txt_error}                            //span[@id='ctl00_phContents_lblMsg']

# Verify popup
${verfiy_approve_popup}                 //font[contains(text(),'Do you want to Approve?')]
${btn_ok_approve_popup}                 id=ctl00_btnOK_ConfirmApprove
${btn_cancel_approve_popup}             id=ctl00_btnCancel_ConfirmApprove

# Button Signout
${loading}                              id=divImage
${btn_signout}                          id=ctl00_lbtnSignOut

# Verify title system
${title_system}                         id=ctl00_phContents_ASPxRoundPanel1_RPHT
${title_system_req_locator}             //span[contains(text(),'Request')]
${title_system_cancel_req_locator}      //span[contains(text(),'Cancel Request')]
${title_head_route_level}               //th[@scope="col" and contains(text(),'Route Level')]
${title_head_user}                      //th[@scope="col" and contains(text(),'User')]
${title_head_date}                      //th[@scope="col" and contains(text(),'Date')]
${title_head_time}                      //th[@scope="col" and contains(text(),'Time')]
${table_manager_locator}                //td[@align="left" and contains(text(),'MANAGER')]
${table_section_locator}                //td[@align="left" and contains(text(),'Section')]