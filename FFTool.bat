ECHO OFF
CLS
Title Firefox Common Lock Tool
Color 17

:MENU

ECHO ...............................................
ECHO PRESS 1 to enable the lock, 2 to disable it, or 0 to EXIT.
ECHO Please ensure the tool is run as admin to work.
ECHO ...............................................
ECHO .
ECHO 1 - Enable locking Firefox policy
ECHO 2 - Disable locking Firefox policy
ECHO 0 - Exit the tool
ECHO.
SET INPUT=
SET /P INPUT=Please select a number then press ENTER:
IF /I '%INPUT%'=='1' GOTO ENFF
IF /I '%INPUT%'=='2' GOTO DISFF
IF /I '%INPUT%'=='0' GOTO QUIT

ECHO ============INVALID INPUT============
ECHO -------------------------------------
ECHO Please select a number from the Main
echo Menu [1 or 2], or select '0' to quit.
ECHO -------------------------------------
ECHO ======PRESS ANY KEY TO CONTINUE======

PAUSE > NUL
GOTO MENU

:ENFF
CLS
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla" /F
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\Extensions\Locked" /V 1 /T REG_SZ /F /D "ApplicationGuardRel@microsoft.com"
::Remove the above comment if ApplicationGuard have been used
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V BlockAboutConfig /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V BlockAboutAddons /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V BlockAboutProfiles /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V BlockAboutSupport /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableDeveloperTools /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFeedbackCommands /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxAccounts /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableFirefoxStudies /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableProfileImport /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableProfileRefresh /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSecurityBypass /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSafeMode /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V DisableSafeMode /T REG_DWORD /F /D 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox" /V Preferences /T REG_MULTI_SZ /F /D "7b000000200020002200620072006f00770073\00650072002e00640069007300610062006c00650052006500\730065007400500072006f006d007000740022003a0020007b\00000020002000200020002200560061006c00750065002200\3a00200031002c000000200020002000200022005300740061\0074007500730022003a00200022006c006f0063006b006500\640022000000200020007d0000000000"
ECHO ===================COMPLETED===================
ECHO -----------------------------------------------
ECHO Enabled locking Firefox
ECHO -----------------------------------------------
ECHO ===========PRESS ANY KEY TO CONTINUE===========
pause > NUL
cls
GOTO QUIT

:DISFF
CLS
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla" /F
ECHO ===================COMPLETED===================
ECHO -----------------------------------------------
ECHO Disabled locking Firefox
ECHO -----------------------------------------------
ECHO ===========PRESS ANY KEY TO CONTINUE===========
pause > NUL
cls
GOTO QUIT

:QUIT
EXIT
