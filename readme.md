# Robot Framework Locators

## การติดตั้ง Robot Framework

### ติดตั้ง Python 3.8.9 64bit

ติดตั้งไปที่ `C:../python38/`

#### ตัวอย่างการติดตั้ง 1

```shell
  C:\Users\Makerz>where python
  C:\Program Files\Python38\python.exe  # click install custom, click install python for all use
  C:\Users\Makerz\AppData\Local\Microsoft\WindowsApps\python.exe
```

#### ตัวอย่างการติดตั้ง 2

```shell
  C:\Users\Makerz>where python
  C:\Users\Makerz\AppData\Local\Programs\Python\Python38\python.exe  # click install auto, not click install python for all use
  C:\Users\Makerz\AppData\Local\Microsoft\WindowsApps\python.exe
```

### คำสั่งที่ใช้ใน CMD

```shell
  where python
  pip list
  python --version
  robot --version
```

### ติดตั้ง Robot Framework และไลบรารีที่จำเป็น

```shell
  pip install robotframework==7.0
  pip install robotframework-seleniumLibrary==6.2.0
  pip install pytest
```

### เตรียม pip

```shell
  py -m pip install --upgrade pip
  py -m pip --version
```

### สร้างและใช้งาน Virtual Environment

#### ขั้นตอนที่ 1: ตั้งค่า .env

สร้าง Virtual Environment ใหม่:

```shell
py -m venv .venv
```

#### ขั้นตอนที่ 2: เปิดใช้งาน Virtual Environment

```shell
.venv\Scripts\activate
```

### รัน pytest

```shell
python -m pytest
```

**หมายเหตุ:** จำตำแหน่งการติดตั้ง Python และโฟลเดอร์ที่ใช้รันโค้ด หากไม่ตรงกันจะไม่สามารถรันทดสอบได้

เมื่อมีการแจ้งเตือนจาก VSCode เกี่ยวกับการตั้งค่า path หากติดตั้ง Python ที่ `C:\Program Files\Python38\python.exe` ให้เลือก path นี้ หากไม่ตรงกันให้เลือก `C:\Users\Makerz\AppData\Local\Microsoft\WindowsApps\python.exe` ตาม path ที่ติดตั้ง

## ตัวอย่าง XPath

- `Xpart=//tagname[@Attribute='value']`
- `//div[contains(.,"hi_username")]`
- `//div[h3[@hello="hi_username"]]//input`
- `//div[h3[@hello="hi_username"]]/ancestor::div/input`
- `//div[h3[@hello="hi_username"]]/following-sibling::input`
- `//input/preceding-sibling::h3[@hello="hi_username"]`
- `//input[@t=yes and @p="yes"]`
- `//h3[@class="s-item_title"]//span[contains(@class,'BOLD')]`
- `//*[contains(@title,'*Please select assignee')]`
- `Parent::div คือการกระโดดไปก่อนหน้า`

## การติดตั้ง ChromeDriver

คุณสามารถดาวน์โหลด ChromeDriver ได้จาก [Google Chrome Labs](https://googlechromelabs.github.io/chrome-for-testing/#stable)

### ขั้นตอนการติดตั้ง ChromeDriver

1. ไปที่หน้า [ดาวน์โหลด ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/#stable)
2. เลือกเวอร์ชันที่ตรงกับเบราว์เซอร์ของคุณ
3. ดาวน์โหลดไฟล์ ZIP ที่เหมาะสมกับระบบปฏิบัติการของคุณ (Windows, Mac, Linux)
4. แตกไฟล์ ZIP และเก็บไฟล์ `chromedriver.exe` ไว้ในโฟลเดอร์ที่คุณต้องการ

### การใช้งาน ChromeDriver กับ Robot Framework

ตัวอย่างการใช้งาน ChromeDriver ใน Robot Framework:

```robot
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${DRIVER_PATH}  C:/path/to/chromedriver.exe

*** Test Cases ***
Open Chrome Browser
    Open Browser  https://www.example.com  browser=chrome  executable_path=${DRIVER_PATH}
    Maximize Browser Window
    Sleep  5 seconds
    Close Browser
```

ในตัวอย่างนี้:

- แทนที่ `${DRIVER_PATH}` ด้วยตำแหน่งที่คุณเก็บไฟล์ `chromedriver.exe`
- ทดสอบการเปิดเบราว์เซอร์ Chrome, ขยายหน้าต่างเบราว์เซอร์, รอ 5 วินาที, และปิดเบราว์เซอร์

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

## auto fomatt petty code

isort extension
autopep8 extension
pip install robotframework-tidy==4.13.0
