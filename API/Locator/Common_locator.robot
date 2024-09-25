*** Variables ***
# Intranet
${URL_Intranet}    https://washmevmm.com
${icon}    //img[@src='./image/logo-wm-300x89.png']

#Browser
${BrowserChrome}    chrome    

# LOGIN User Authentication
${id_username}    name=Username
${id_password}    name=Password
${btn_login}    //button[@type='submit']
${btn_logout}    //button[@id='exit']
${btn_con}    //button[@class='swal-button swal-button--confirm swal-button--danger']

#API URL
${URL_API}    https://makerzcoding.com/fridayqr-sdk-apiv2/api/api.php