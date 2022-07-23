@Echo off
title Exclusively for my loveable RMX1901 Community 
Echo. Disclaimer: 
Echo. =============
color 0c
Echo.I am not responsible for bricked devices, dead SD cards, thermonuclear war, or you getting fired because the alarm app failed. Please do some research or ask in Specific group if you have any concerns about features included in this Flash tool before flashing it! YOU are choosing to make these modifications, and if you point the finger at me for messing up your device, I will laugh at you. Do remember. 
Echo. 
Echo. ==============================================
Echo. If you agree then Click any key to Continue...
Pause>nul
cls
color 0a
cd %~dp0
Echo        =========================================
Echo        ! @monst8r Flash Tool Enter Your Choice !
ECHO.       =========================================
Echo.
Echo.       !     -1.Reboot Bootloader              ! 
ECHO.
Echo.       !     -2.ADB / Bootloader Not Detected  !
ECHO.
Echo.       !     -3.Flash RUI2 ROOT with Magisk    !
ECHO.
Echo.       !     -4.Unroot RUI2                    !
ECHO.
Echo.       !     -5.Downgrade to RUI1 from RUI2    !
Echo.
Echo.       !     -6.Debloat Whole COS6/RUI1/RUI2   !
Echo.
Echo.       !     -7.Format Data from Bootloader    !
Echo.
Echo.       =========================================
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
Echo.
set choice=
set /p choice= Chosen: 
IF NOT "%choice%"=="" SET choice=%choice:~0%
if /i "%choice%"=="1" goto rebl 
if /i "%choice%"=="2" goto adbiss
if /i "%choice%"=="3" goto rooting 
if /i "%choice%"=="4" goto unrt
if /i "%choice%"=="5" goto down
if /i "%choice%"=="6" goto dblt
if /i "%choice%"=="7" goto frmt
:rebl
cls
echo.
Echo.       =========================================
Echo.       !         -1.Reboot Bootloader          !
Echo.       !=======================================!
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
echo.
Echo Rebooting your Device to Bootloader...
Echo Checking Device...
.\tools\adb.exe wait-for-device
.\tools\adb.exe reboot-bootloader
Echo Please Wait 7 seconds...
timeout -t 7 >nul
Echo Done.
echo.
pause>nul
exit 0
:adbiss
cls
echo.
Echo.       =========================================
Echo.       !    -2.ADB / Bootloader Not Detected   !
Echo.       !=======================================!
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
echo.
Echo >>>> Intializing Device...
Echo >>>> Checking Device...
Echo >>>> Trying to execute ADB Driver Files...
%SystemRoot%\System32\InfDefaultInstall.exe ".\tools\android_winusb.inf"
echo. Done.
echo.
Echo >>>> Trying to Register USB Fix Keys...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbflags\18D1D00D0100" /v "osvc" /t REG_BINARY /d "0000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbflags\18D1D00D0100" /v "SkipContainerIdQuery" /t REG_BINARY /d "01000000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbflags\18D1D00D0100" /v "SkipBOSDescriptorQuery" /t REG_BINARY /d "01000000" /f
echo. Done.
echo.
.\tools\adb.exe wait-for-device
.\tools\adb.exe reboot-bootloader
echo.
Echo Please Wait 10 seconds...
timeout -t 10
echo. 
cls
echo.
Echo. Fetchig Device Status...
Echo.
Echo.       =========================================
Echo.       !   -2.ADB / Bootloader Not Detected    !
Echo.       !=======================================!
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
Echo.
Echo.       =========================================
Echo.       !          -Device Details              !
Echo.       !=======================================!
.\tools\fastboot.exe devices
Echo.
Echo.
Echo.       =========================================
Echo.       !      -System Fastboot Details         !
Echo.       !=======================================!
.\tools\fastboot.exe --version
Echo.
echo.
Echo.       =========================================
Echo.       !   ADB/ Bootloader Fixed Succesfully   !
Echo.       !   Now Device will Reboot to System    !
Echo.       !=======================================!
Echo.
.\tools\fastboot.exe reboot
pause>nul
exit 0
:rooting
cls
echo.
Echo.       =========================================
Echo.       !     -3.Flash RUI2 ROOT with Magisk    !
Echo.       !=======================================!
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
echo.       ! N.B:  Your Device should be on ADB    !
echo.       =========================================
echo.
Echo.       !=======================================!
Echo.       !       Rebooting to Bootloader         !
Echo.       !=======================================!
echo.
.\tools\adb.exe reboot-bootloader
echo. Done.
echo.
Echo.       !=======================================!
Echo.       !       Flashing VBMETA 1st half        !
Echo.       !=======================================!
echo.
.\tools\fastboot.exe  --disable-verity --disable-verification flash vbmeta .\images\vbmeta.img
echo. Done.
echo.
Echo.       !=======================================!
Echo.       !          Flashing New TWRP            !
Echo.       !=======================================!
echo.
.\tools\fastboot.exe  flash recovery  .\images\rui2.img
echo. Done.
echo.
Echo.       !=======================================!
Echo.       !      Rebootinhg to New Recovery       !
Echo.       !=======================================!
echo.
.\tools\fastboot.exe  reboot-recovery
echo.
Echo.       !=======================================!
Echo.       !     Done 1st stage of Flashing        !
Echo.       !=======================================!
echo.
Echo Please Wait 10 seconds for 2nd Phase Flashing...
timeout -t 7 >nul
cls
color 0c
echo. >>>> NOW PLEASE TURN ON YOUR ADB SIDELOAD FROM TWRP HOMEPAGE- Advanced- ADB Sideload- Swipe <<<<
echo. >>>> When Ready Please hit Enter...
pause>nul
color 0a
echo.
Echo.       !=======================================!
Echo.       !     Starting Magisk.zip Flashing      !
Echo.       !=======================================!
echo.
.\tools\adb.exe sideload .\images\magisk.zip
echo. Done.
echo.
echo. >>>> Please now comeback to TWRP HOMEPAGE and do Reboot to Recovery <<<<
echo. >>>> When Ready Hit Enter...
pause>nul
.\tools\fastboot.exe  --disable-verity --disable-verification flash vbmeta .\images\vbmeta.img
echo.
Echo Rebooting...
.\tools\fastboot.exe reboot
echo.
echo. Done
echo.
pause>nul
exit 0
:unrt
cls
echo.
Echo.       =========================================
Echo.       !            -4.Unroot RUI2             !
Echo.       !=======================================!
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
echo.       ! N.B:  Your Device should be on ADB    !
echo.       =========================================
echo.
echo. >>>> Rebooting to Bootloader...
.\tools\adb.exe reboot-bootloader
echo. Done.
echo.
echo. >>>> Flashing VBMETA 1st half...
.\tools\fastboot.exe  --disable-verity --disable-verification flash vbmeta .\images\vbmeta.img
echo. Done.
echo.
echo. >>>> Trying to flash New TWRP now...
.\tools\fastboot.exe  flash recovery  .\images\rui2.img
echo. Done.
echo.
echo. >>>> Forcing to reboot to New Recovery...
.\tools\fastboot.exe  reboot-recovery
echo. Done.
echo.
echo. >>>> NOW PLEASE TURN ON YOUR ADB SIDELOAD FROM TWRP HOMEPAGE- Advanced- ADB Sideload- Swipe >>>>
echo. >>>> When Ready Please hit Enter...
pause>nul
echo. >>>> Starting Latest Magisk Uninstaller...
.\tools\adb.exe sideload .\images\unmagisk.zip
echo. Done.
echo.
echo. >>>> Please now comeback to TWRP HOMEPAGE and do Reboot- Bootloader >>>>
.\tools\fastboot.exe  --disable-verity --disable-verification flash vbmeta .\images\vbmeta.img
echo.
Echo Rebooting...
.\tools\fastboot.exe reboot
echo.
pause>nul
exit 0
:down
cls
echo.
Echo.       =========================================
Echo.       !     -5.Downgrade to RUI1 from RUI2    !
Echo.       !=======================================!
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
echo.       ! N.B:Your Device should be on ADB      !
echo.       =========================================
Echo. 
echo.>>>> Rebooting to Bootloader...
.\tools\adb.exe reboot-bootloader
echo. Done.
echo.
echo.>>>> Flashing VBMETA 1st half...
.\tools\fastboot.exe --disable-verity --disable-verification flash vbmeta .\images\vbmeta.img
echo. Done.
echo.
echo.>>>> Trying to flash New TWRP now...
.\tools\fastboot.exe flash recovery .\images\rui2.img
echo. Done.
echo.
echo.>>>> Forcing to reboot to New Recovery...
.\tools\fastboot.exe reboot-recovery
echo. Done.
echo.
echo. >>>> NOW PLEASE TURN ON YOUR ADB SIDELOAD FROM TWRP HOMEPAGE- Advanced- ADB Sideload- Swipe <<<<
echo. >>>> When Ready Please hit Enter...
pause>nul
echo. >>>> Starting Latest Magisk Uninstaller...
.\tools\adb.exe sideload .\images\ruifirmware.zip
echo. Done.
echo.
echo. >>>> Please now comeback to TWRP HOMEPAGE and do Reboot to Bootloader 
pause
echo.
echo. Trying to flash Old TWRP suitable for RUI1
echo.
.\tools\fastboot.exe flash recovery .\images\rui1.img
echo.
echo. Trying to Format Data once...
.\tools\fastboot.exe -w
echo.
echo. Trying to flash VBMETA suitable for RUI1...
echo.
.\tools\fastboot.exe --disable-verity --disable-verification flash vbmeta .\images\vbmeta.img
echo. Rebooting System...
.\tools\fastboot.exe reboot
echo.
echo. Done
echo.
pause>nul
exit 0
:dblt
cls
echo.
Echo.       =========================================
Echo.       !     -6.Debloat Whole COS6/RUI1/RUI2   !
Echo.       !=======================================!
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
echo.       ! N.B:  Your Device should be on ADB    !
echo.       =========================================
echo.
Echo Connect your device in ADB MODE with USB DEBUGGING Enabled...
Echo Checking Device...
echo Debloating (uninstalling quite a few packages, standby a minute or two). . .
start .\tools\dblt.bat
echo.
echo Another Window Opened for Debloating...
Echo.
pause>nul
exit 0
:frmt
cls
echo.
Echo.       =========================================
Echo.       !    -7.Format Data from Bootloader     !
Echo.       !=======================================!
Echo.       !        Donate me for a New RAM        !
Echo.       !           6290457673@paytm            !
Echo.       =========================================
echo.       ! N.B:Your Device should be on Fastboot !
echo.       =========================================
echo.Press any key to Format Data Partition
pause>nul
echo.Formatting userdata...
.\tools\fastboot.exe  -w
echo. Done.
echo.
Echo Rebooting...
.\tools\fastboot.exe reboot
echo. Done.
echo.
pause>nul
exit 0




