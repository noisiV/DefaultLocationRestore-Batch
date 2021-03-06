@ECHO OFF

GOTO :menu

:menu 
echo ===============================================================
echo ==           DEFAULT LOCATION RESTORATION TOOL               ==
echo ==        RESTORES DEFAULT LOCATIONS FOR USER DATA.          ==
echo == ENDS EXPLORER, RESTORES DEFAULT LOCATION, STARTS EXPLORER ==
echo ==               CREATED BY TYLER C. @0xTylerr               ==
echo ===============================================================
echo TO BEGIN, SELECT WHICH LOCATION TO RESTORE
echo 1. Desktop
echo 2. Documents
echo 3. Favorites
echo 4. Downloads
echo 5. Contacts
echo 6. Exit

set /P M=Type 1-6 and then press enter:
if %M%==1 goto :de
if %M%==2 goto :do
if %M%==3 goto :fa
if %M%==4 goto :dow
if %M%==5 goto :co
if %M%==6 goto :kill

@ECHO ON 


:de
taskkill /f /im explorer.exe
timeout /t 2 /nobreak >nul
if not exist "%UserProfile%\Desktop" mkdir "%UserProfile%\Desktop"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop" /t REG_SZ /d "C:\Users\%USERNAME%\Desktop" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Desktop" /f
attrib +r -s -h "%USERPROFILE%\Desktop" /S /D
timeout /t 1 /nobreak >nul
start explorer.exe
pause
goto :menu

:do
taskkill /f /im explorer.exe
timeout /t 2 /nobreak >nul
if not exist "%UserProfile%\Documents" mkdir "%UserProfile%\Documents"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal" /t REG_SZ /d "C:\Users\%USERNAME%\Documents" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{f42ee2d3-909f-4907-8871-4c22fc0bf756}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Documents" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Documents" /f
attrib +r -s -h "%USERPROFILE%\Documents" /S /D
timeout /t 1 /nobreak >nul
start explorer.exe
pause
goto :menu

:fa
taskkill /f /im explorer.exe
timeout /t 2 /nobreak >nul
if not exist "%UserProfile%\Favorites" mkdir "%UserProfile%\Favorites"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Favorites" /t REG_SZ /d "C:\Users\%USERNAME%\Favorites" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Favorites" /f
attrib +r -s -h "%USERPROFILE%\Favorites" /S /D
timeout /t 1 /nobreak >nul
start explorer.exe
pause
goto :menu

:dow
taskkill /f /im explorer.exe
timeout /t 2 /nobreak >nul
if not exist "%UserProfile%\Downloads" mkdir "%UserProfile%\Downloads"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\Users\%USERNAME%\Downloads" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Downloads" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Downloads" /f
attrib +r -s -h "%USERPROFILE%\Downloads" /S /D
timeout /t 1 /nobreak >nul
start explorer.exe
pause
goto :menu

:co
taskkill /f /im explorer.exe
timeout /t 2 /nobreak >nul
if not exist "%UserProfile%\Contacts" mkdir "%UserProfile%\Contacts"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{56784854-C6CB-462B-8169-88E350ACB882}" /t REG_SZ /d "C:\Users\%USERNAME%\Contacts" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462B-8169-88E350ACB882}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Contacts" /f
attrib +r -s -h "%USERPROFILE%\Contacts" /S /D
timeout /t 1 /nobreak >nul
start explorer.exe
pause
goto :menu

:kill
exit
