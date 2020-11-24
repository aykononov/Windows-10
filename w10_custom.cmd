@echo off
chcp 1251

:x00
cls
echo.
echo  -----------------------------------------------------------------
echo    Windows Custom
echo  -----------------------------------------------------------------
echo   1 (WinSxS) Анализ текущего состояния хранилища компонент
echo   2 - (WinSxS) Удаление предыдущих версий для текущего пользователя
echo   3 - (WinSxS) Полное удаление предыдущих версий
echo   4 (Packages) Вывод установленных пакетов
echo   5 - (Packages) Полное удаление всех стандартных приложений
echo   6 - (Packages) Восстановление всех стандартных приложений
echo   7 (Microsoft Store) Установка магазина
echo   8 (Cleanmgr) Очистка Диска
echo   9 Настройка реестра
echo  10 (Edge Chromium) удаление
echo   0 - Выход
echo  ------------------------------------------------------------------
echo.

SET /P N=" Введите номер: "

if /i '%N%'=='1' goto x1
if /i '%N%'=='2' goto x2
if /i '%N%'=='3' goto x3
if /i '%N%'=='4' goto x4
if /i '%N%'=='5' goto x5
if /i '%N%'=='6' goto x6
if /i '%N%'=='7' goto x7
if /i '%N%'=='8' goto x8
if /i '%N%'=='9' goto x9
if /i '%N%'=='10' goto x10
if /i '%N%'=='0' goto x0

:x1
cls
echo.
echo Анализ текущего состояния хранилища компонент (WinSxS)
echo ------------------------------------------------------
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
echo.
pause
goto x00

:x2
cls
echo.
echo Удаление предыдущих версий для текущего пользователя
echo ------------------------------------------------------
Dism.exe /Online /Cleanup-Image /StartComponentCleanup
echo.
pause
goto x00


:x3
cls
echo.
echo Полное удаление предыдущих версий
echo ------------------------------------------------------
Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
echo.
pause
goto x00

:x4
cls
echo.
echo Вывод установленных пакетов
echo ------------------------------------------------------
PowerShell -Command "&{Get-AppxPackage | Select Name, PackageFullName}"
echo.
pause
goto x00

:x5
cls
echo.
echo Полное удаление всех стандартных приложений
echo ------------------------------------------------------
PowerShell -ExecutionPolicy Unrestricted -Command "&{Get-AppxPackage -allusers | Remove-AppxPackage}"
rem Удалить пакет *people* для всех пользователей Get-AppxPackage -allusers *people* | Remove-AppxPackage

echo.
pause
goto x00

:x6
cls
echo.
echo Восстановление всех стандартных приложений
echo ------------------------------------------------------
rem команда для powershell: Get-AppxPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml"
rem PowerShell -ExecutionPolicy Unrestricted -Command "& {$ manifest = (Get-AppxPackage Microsoft.WindowsStore) .InstallLocation + '\ AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register $ manifest}"
PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage -AllUsers).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
echo.
pause
goto x00

:x7
cls
echo.
echo Установка магазина (Microsoft Store)
echo ------------------------------------------------------
rem команда для powershell: Get-AppxPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml"
rem PowerShell -ExecutionPolicy Unrestricted -Command "& {$ manifest = (Get-AppxPackage Microsoft.WindowsStore) .InstallLocation + '\ AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register $ manifest}"
PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsStore* -AllUsers).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
echo.
pause
goto x00

:x8
cls
echo.
echo Очистка диска - ждем ...
net stop wuauserv
DEL /S /F /Q %TEMP%\*
RD /S /Q %WINDIR%\SoftwareDistribution\Download
echo Очистка каталгов (%TEMP%, %WINDIR%\SoftwareDistribution\Download) - выполнено.
net start wuauserv
start /WAIT cleanmgr /LowDisk
rem start /WAIT cleanmgr /sageset:65535 & cleanmgr /sagerun:65535
rem cls
echo.
echo Очистка диска выполнена.
pause
goto x00

:x9
cls
echo.
echo Настройка реестра:
echo ------------------------------------------------------
echo Отключить фоновое изображение входа
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /V "DisableLogonBackgroundImage" /t REG_DWORD /F /D "1"

echo Отключаем «Кортану»
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /V "AllowCortana" /t REG_DWORD /F /D "0"

echo Удалить папку «Видео»
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /F

echo Удалить папку «Документы»
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /F

echo Удалить папку «Загрузки»
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /F

echo Удалить папку «Изображения»
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /F

echo Удалить папку «Музыка»
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /F

echo Удалить папку «Объёмные объекты»
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /F

echo Удалить папку «Рабочий стол»
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /F

echo Отключить службу «Факс»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Fax" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Общий доступ к портам Net.Tcp»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetTcpPortSharing" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Рабочие папки»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\workfolderssvc" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить «Служба маршрутизатора AllJoyn»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AJRouter" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Удостоверение приложения»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppIDSvc" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить «Служба шифрования дисков BitLocker»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BDESVC" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Функциональные возможности для подключенных пользователей и телеметрия»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Общий доступ к подключению к Интернету (ICS)»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Сетевая служба Xbox Live»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Биометрическая служба Windows»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WbioSrvc" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Удаленный реестр»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Служба управления радио»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RmSvc" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Служба сенсорной клавиатуры и панели рукописного ввода»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TabletInputService" /V "Start" /t REG_DWORD /F /D "4"

echo Отключить службу «Служба географического положения»
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc" /V "Start" /t REG_DWORD /F /D "4"
echo.
pause
goto x00

:x10
cls
echo.
echo Удаление Microsoft Edge Chromium
echo ------------------------------------------------------
rem cd C:\Program Files (x86)\Microsoft\Edge\Application\85.0.564.51\Installer
cd C:\Program Files (x86)\Microsoft\Edge\Application\86.0.622.58\Installer
setup.exe -uninstall -system-level -verbose-logging -force-uninstall 
echo.
pause

goto x00


:x0
exit
