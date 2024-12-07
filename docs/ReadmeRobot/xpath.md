# Robot Framework Locators

## แท็กพื้นฐาน (Basic Tags)

### เอกสาร (Document)

- **doctype_html**: `<!DOCTYPE html>`
- **html_root**: `<html>`
- **head_section**: `<head>`
- **body_section**: `<body>`

### ส่วนหัว (Head)

- **title_page_title**: `<title>`
- **meta_charset**: `<meta charset='UTF-8'>`
- **link_stylesheet**: `<link rel='stylesheet' href='styles.css'>`
- **script_js**: `<script src='script.js'></script>`
- **style_css**: `<style>`

## แท็กข้อความ (Text Tags)

### หัวเรื่อง (Headings)

- **h1_main_title_id**: `id=main-title`
- **h2_subheading_class**: `class=subheading`
- **h3_section_title_xpath**: `xpath=//h3[@class='section-title']`

### ย่อหน้า (Paragraph)

- **p_intro_id**: `id=intro`
- **p_description_class**: `class=description`
- **p_text_xpath**: `xpath=//p[contains(text(), 'example')]`

### ลิงก์ (Links)

- **a_home_id**: `id=home`
- **a_contact_class**: `class=contact-link`
- **a_about_xpath**: `xpath=//a[@href='/about']`

### อื่น ๆ (Others)

- **span_error_message_class**: `class=error-message`
- **strong_important_text_xpath**: `xpath=//strong[contains(text(), 'important')]`
- **emphasized_note_id**: `id=note`

## แท็กรูปภาพและมัลติมีเดีย (Image and Multimedia Tags)

### รูปภาพ (Images)

- **img_logo_src**: `src='logo.png'`
- **img_banner_alt**: `alt='Banner'`
- **img_avatar_class**: `class='avatar-img'`

### เสียง (Audio)

- **audio_background_id**: `id=background-audio`
- **audio_controls_class**: `class=audio-controls`
- **audio_sample_xpath**: `xpath=//audio[@src='sample.mp3']`

### วิดีโอ (Video)

- **video_intro_id**: `id=intro-video`
- **video_controls_class**: `class=video-controls`
- **video_tutorial_xpath**: `xpath=//video[@src='tutorial.mp4']`

## แท็กฟอร์ม (Form Tags)

### ฟอร์ม (Form)

- **form_login_id**: `id=login-form`
- **form_signup_class**: `class=signup-form`
- **form_search_xpath**: `xpath=//form[@name='search']`

### อินพุต (Input)

- **input_username_name**: `name=username`
- **input_password_placeholder**: `placeholder='Enter your password'`
- **input_email_xpath**: `xpath=//input[@type='email']`

### ปุ่ม (Button)

- **button_submit_id**: `id=submit-button`
- **button_reset_class**: `class=reset-btn`
- **button_cancel_xpath**: `xpath=//button[@type='button' and text()='Cancel']`

### พื้นที่ข้อความ (Textarea)

- **textarea_message_id**: `id=message`
- **textarea_feedback_class**: `class=feedback`
- **textarea_comments_xpath**: `xpath=//textarea[@name='comments']`

### รายการเลือก (Select and Option)

- **select_country_id**: `id=country-select`
- **select_language_class**: `class=language-dropdown`
- **option_english_xpath**: `xpath=//select[@id='language-select']/option[@value='en']`

### ป้ายชื่อ (Label)

- **label_username_for**: `for=username`
- **label_password_class**: `class=password-label`
- **label_email_xpath**: `xpath=//label[text()='Email']`

## แท็กตาราง (Table Tags)

### ตาราง (Table)

- **table_user_list_id**: `id=user-table`
- **table_product_class**: `class=product-table`
- **table_data_xpath**: `xpath=//table[@summary='data']`

### แถว (Row)

- **tr_header_row_class**: `class=header-row`
- **tr_odd_row_xpath**: `xpath=//tr[contains(@class, 'odd-row')]`
- **tr_first_row_xpath**: `xpath=//table[@id='data-table']/tbody/tr[1]`

### เซลล์ (Cell)

- **td_username_id**: `id=username-cell`
- **td_price_class**: `class=price-cell`
- **td_status_xpath**: `xpath=//td[@class='status']`

### หัวเรื่องของเซลล์ (Header Cell)

- **th_username_id**: `id=username-header`
- **th_price_class**: `class=price-header`
- **th_status_xpath**: `xpath=//th[text()='Status']`

### ส่วนประกอบของตาราง (Table Sections)

- **thead_table_head_class**: `class=table-head`
- **tbody_table_body_id**: `id=table-body`
- **tfoot_table_foot_xpath**: `xpath=//tfoot[@class='table-foot']`

## แท็กอื่น ๆ (Other Tags)

### เอกสารภายใน (IFrame)


- **iframe_content_id**: `id=content-iframe`
- **iframe_video_class**: `class=video-iframe`
- **iframe_ad_xpath**: `xpath=//iframe[@src='ad.html']`

### ภาพกราฟิก (Canvas)

- **canvas_chart_id**: `id=chart-canvas`
- **canvas_drawing_class**: `class=drawing-canvas`
- **canvas_game_xpath**: `xpath=//canvas[@class='game-canvas']`

### ภาพกราฟิกแบบเวกเตอร์ (SVG)

- **svg_icon_id**: `id=icon-svg`
- **svg_logo_class**: `class=logo-svg`
- **svg_graph_xpath**: `xpath=//svg[@class='graph-svg']`


