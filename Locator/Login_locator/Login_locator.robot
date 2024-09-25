*** Variables ***
# iframe
${iframe_locator}                       //iframe[@id='myiframeid']

# Select request
${sel_request_type_locator}             //select[@id='ctl00_phContents_ASPxRoundPanel1_D_request_type']

# Request
${lbl_id_card}                          //font[contains(text(),'ID Card')]
${req_id_card}                          id=ctl00_phContents_ASPxRoundPanel1_E_id
${lbl_req_business}                     //font[contains(text(),'Business')]
${sel_req_business}                     //select[@id='ctl00_phContents_ASPxRoundPanel1_D_biz']
${lbl_contract_no}                      //font[contains(text(),'Contract No')]
${req_contract_no}                      id=ctl00_phContents_ASPxRoundPanel1_E_cont_no

# Request page 2
${lbl_receipt_no}                       //font[contains(.,'Receipt No.')]
${req_receipt_no}                       id=ctl00_phContents_ASPxRoundPanel1_E_receive_no
${btn_receipt_add}                      id=ctl00_phContents_ASPxRoundPanel1_B_add_receive
${table_receipt}                        //table[@id='ctl00_phContents_ASPxRoundPanel1_GD_DataView']

# Request Verify
${test_loop}                            
${txt_replace}                          //*[contains(text(),'***replace***')]
${lbl_verify_header}                    //span[contains(text(),'***relace***')]
${lbl_request_type}                     //td[contains(text(),'Request') and contains(text(),'Type')]
${lbl_customer_id}                      //td[contains(text(),'Customer') and contains(text(),'ID')]
${lbl_customer_name}                    //font[contains(text(),'Customer Name')]
${lbl_business}                         //font[contains(text(),'Business')]
${lbl_request_no}                       //font[contains(text(),'Request No.')]
${lbl_request_date}                     //font[contains(text(),'Request Date')]
${lbl_requester}                        //font[contains(text(),'Requester')]
${lbl_team}                             //font[contains(text(),'Team')]
${lbl_od_status}                        //font[contains(text(),'OD Status')]
${lbl_total_os_balance}                 //font[contains(text(),'Total O/S Balance')]
${lbl_total_penalty}                    //font[contains(text(),'Total Penalty')]

${txt_request_type}                     id=ctl00_phContents_ASPxRoundPanel1_D_request_type
${txt_customer_id}                      id=ctl00_phContents_ASPxRoundPanel1_E_id
${txt_customer_name}                    id=ctl00_phContents_ASPxRoundPanel1_E_name
${txt_business}                         id=ctl00_phContents_ASPxRoundPanel1_D_biz
${txt_request_no}                       id=ctl00_phContents_ASPxRoundPanel1_E_request_no    # Request No  
${txt_contract_no}                      id=ctl00_phContents_ASPxRoundPanel1_E_cont_no   
${txt_request_date}                     id=ctl00_phContents_ASPxRoundPanel1_E_request_date
${txt_requester}                        id=ctl00_phContents_ASPxRoundPanel1_E_requester
${txt_team}                             id=ctl00_phContents_ASPxRoundPanel1_E_term
${txt_od_status}                        id=ctl00_phContents_ASPxRoundPanel1_E_odterm
${txt_total_os_balance}                 id=ctl00_phContents_ASPxRoundPanel1_E_tot_os_bal
${txt_total_penalty}                    id=ctl00_phContents_ASPxRoundPanel1_E_tot_penalty

# Request page 2 input 
${lbl_req_waive_amount}                 //font[contains(text(),'Waive Amount')]
${req_waive_amount}                     id=ctl00_phContents_ASPxRoundPanel1_E_waive_amt
${lbl_req_reason}                       //font[contains(text(),'Reason')]
${sel_req_reason}                       //select[@id='ctl00_phContents_ASPxRoundPanel1_D_reason']
${lbl_req_send_to}                      //font[contains(text(),'Send To')]
${sel_req_send_to}                      //select[@id='ctl00_phContents_ASPxRoundPanel1_D_send_to']
${lbl_req_reason_note}                  //font[contains(text(),'Reason Note')]
${req_reason_note}                      id=ctl00_phContents_ASPxRoundPanel1_E_reason_note
${lbl_req_note}                         //font[contains(text(),'Note')]
${req_note}                             //textarea[@id='ctl00_phContents_ASPxRoundPanel1_E_note']