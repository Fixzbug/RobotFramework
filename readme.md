
# Robot Framework On Jenkins

* ถ้า robot error ตอนรัน jenkins 

'robot' is not recognized as an internal or external command,
operable program or batch file.
ERROR: Input redirection is not supported, exiting the process immediately.

ให้ set env ตามตำแหน่งที่ติดตั้ง

C:\Users\Makerz\AppData\Local\Programs\Python\Python311\
C:\Users\Makerz\AppData\Local\Programs\Python\Python311\Scripts\
C:\Users\Makerz\AppData\Local\Programs\Python\Python311\Scripts\robot.exe


# How to restart 

C:\Program Files\Jenkins\Jenkins.exe restart
C:\Program Files\Jenkins\Jenkins.exe start
C:\Program Files\Jenkins\Jenkins.exe stop


# Robot Framework
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
  python --version
  pip list

  where robot
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
```

### สร้างและใช้งาน Virtual Environment แบบจำลองแต่ละโปรเจค

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

## auto fomatt petty code

isort extension
autopep8 extension
pip install robotframework-tidy==4.13.0


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

