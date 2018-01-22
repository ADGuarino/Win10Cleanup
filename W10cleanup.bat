@echo off
set /p PC=[Enter Target Computer]
NET USE T: \\%PC%\C$
T:
cd /D T:\USERS
REM -Cleaning Temp Folders
for /D %%a in (*.*) do DEL /F /S /Q "%%a\AppData\Local\Temp\*.*"
for /D %%a in (*.*) do FOR /D %%b IN ("%%a\AppData\Local\Temp\*.*") DO RMDIR /S /Q "%%b"
for /D %%a in (*.*) do DEL /F /Q "%%a\AppData\Roaming\*.exe"
REM -Cleaning Cache (Outlook & IE) & Cookies
for /D %%a in (*.*) do DEL /F /S /Q "%%a\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
for /D %%a in (*.*) do FOR /D %%b IN ("%%a\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*") DO RMDIR /S /Q "%%b"
for /D %%a in (*.*) do DEL /F /S /Q "%%a\AppData\Local\Microsoft\Windows\INetCookies\*.*"
for /D %%a in (*.*) do DEL /F /S /Q "%%a\AppData\Local\Microsoft\Windows\IEDownloadHistory\*.*"
for /D %%a in (*.*) do DEL /F /S /Q "%%a\AppData\Local\Microsoft\Windows\INetCache\*.*"
for /D %%a in (*.*) do DEL /F /S /Q "%%a\AppData\Local\Microsoft\Terminal Server Client\Cache\*.*"
for /D %%a in (*.*) do DEL /F /S /Q "%%a\AppData\Local\Microsoft\Windows\WER\*.*"
REM -Cleaning Windows Temp
DEL /F /S /Q "T:\Windows\Temp\*.*"
DEL /F /S /Q "T:\Windows\NewTemp\*.*"
FOR /D %%c IN ("T:\Windows\Temp\*.*") DO RMDIR /S /Q "%%c"
FOR /D %%d IN ("T:\Windows\NewTemp\*.*") DO RMDIR /S /Q "%%d"
C:
NET USE T: /DELETE

