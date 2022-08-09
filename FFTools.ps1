# This tool require administrator right, please allow it to start the tool correctly

if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
$host.UI.RawUI.WindowTitle = "Firefox Common Lock Tool"

function EnableFFLock {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "BlockAboutConfig" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "BlockAboutAddons" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "BlockAboutProfiles" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "BlockAboutSupport" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableDeveloperTool" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableFeedbackCommands" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableFirefoxAccounts" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableFirefoxStudies" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableFirefoxAccounts" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableProfileImport" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableProfileRefresh" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableSecurityBypass" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableSafeMode" -Value "1" -PropertyType DWord -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Name "DisableFirefoxAccounts" -PropertyType MultiString -Value "7b000000200020002200620072006f00770073\
        00650072002e00640069007300610062006c00650052006500\
        730065007400500072006f006d007000740022003a0020007b\
        00000020002000200020002200560061006c00750065002200\
        3a00200031002c000000200020002000200022005300740061\
        0074007500730022003a00200022006c006f0063006b006500\
        640022000000200020007d0000000000" -Force
}

function RemoveFFPolicies {
    Remove-Item -Path "HKLM:\SOFTWARE\Policies\Mozilla\Firefox" -Recurse -ErrorAction silentlycontinue
}

function Display-Menu {
    Clear-host
    Write-Host @"

  ______ _          ______           _____                                        _                _    
 |  ____(_)        |  ____|         / ____|                                      | |              | |   
 | |__   _ _ __ ___| |__ _____  __ | |     ___  _ __ ___  _ __ ___   ___  _ __   | |     ___   ___| | __
 |  __| | | '__/ _ \  __/ _ \ \/ / | |    / _ \| '_ ` _ \| '_ ` _ \ / _ \| '_ \  | |    / _ \ / __| |/ /
 | |    | | | |  __/ | | (_) >  <  | |___| (_) | | | | | | | | | | | (_) | | | | | |___| (_) | (__|   < 
 |_|    |_|_|  \___|_|  \___/_/\_\  \_____\___/|_| |_| |_|_| |_| |_|\___/|_| |_| |______\___/ \___|_|\_\
                                                                                                        
                                                                                                        

    ------------------------------------------------------------
    
    PRESS 1 to enable the lock, 2 to disable it, or 0 to EXIT.
    Please ensure the tool is run as admin to work.

    ------------------------------------------------------------

    Press 1 - Enable locking Firefox policy
    Press 2 - Disable locking Firefox policy
    Press 0 - Exit the tool

"@
Choice-Forward
}

function Choice-Forward {

$Choice = Read-Host -Prompt 'Input your selection'
switch -Exact ($Choice)
{
    '1' {
        Clear-Host
        RemoveFFPolicies
        EnableFFLock
        '===================COMPLETED==================='
        '-----------------------------------------------'
        '          Firefox Common Lock enabled          '
        '-----------------------------------------------'
        '=============PRESS ANY KEY TO EXIT============='
        Read-Host
        Exit
        }
    '2' {
        Clear-Host
        RemoveFFPolicies
        '===================COMPLETED==================='
        '-----------------------------------------------'
        '          Firefox Common Lock disabled          '
        '-----------------------------------------------'
        '=============PRESS ANY KEY TO EXIT============='
        Read-Host
        Exit
        }
    '0' {
        Exit
        }
    default {  
        Write-Warning '============INVALID INPUT============'
        Write-Warning '-------------------------------------'
        Write-Warning 'Please select a number from the Main'
        Write-Warning 'Menu [1 or 2], or select [0] to quit.'
        Write-Warning '-------------------------------------'
        Write-Warning '======PRESS ANY KEY TO CONTINUE======'
        Read-Host
        Clear-host
        Display-Menu
        }
}

}

Display-Menu

