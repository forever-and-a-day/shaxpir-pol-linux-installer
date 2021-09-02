#!/bin/bash 
# Date : (2021-08-26 9:30)
# Last revision : 2021-08-26
# Wine version used : 5.22
# Distribution used to test : Linux Mint 20 Cinnamon
# Author : forever-and-a-day
# Licence : Retail
# Only For : http://www.playonlinux.com
#
#  
# CHANGELOG
# [CamazingMe] v1
# 
# KNOWN ISSUES :
#  - (2021-08-26) Window maximizing is weird. Rezize window manually.
# NOTE: Based on: https://www.playonlinux.com/en/app-4-Steam.html

 
  
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"
  
TITLE="Shaxpir"
WINEVERSION="5.22"
PREFIX="Shaxpir"
  
# Starting the script
POL_SetupWindow_Init
POL_SetupWindow_presentation "$TITLE" "Shaxpir" "https://shaxpir.com/" "forever-and-a-day" "$PREFIX"

POL_System_SetArch "x64"

POL_SetupWindow_free_presentation "$TITLE" "Welcome to the Shaxpir installation wizard."
#POL_SetupWindow_message "$(eval_gettext 'This installer is unofficial and is not affiliated with Shaxpir, inc.')" "$TITLE"
POL_SetupWindow_message "This installer is unofficial, not supported, and is not affiliated with Shaxpir, Inc. in any way. Use of Shaxpir is governed by its Terms of Use (https://shaxpir.com/terms-of-service) and Privacy Policy (https://shaxpir.com/privacy-policy)" "Disclaimer"

POL_SetupWindow_message "To ensure that Shaxpir installs correctly and runs in the future, ensure you check the box to run Shaxpir after installation. If you don't, Shaxpir may crash and reqire reinstallation." "Important!"

# Downloading wine if necessary and creating prefix
POL_Wine_PrefixCreate "$WINEVERSION"
  
# Installing mandatory dependencies
# POL_Wine_InstallFonts
# POL_Call POL_Install_corefonts
# POL_Function_FontsSmoothRGB
  
# Downloading latest version
cd "$POL_USER_ROOT/wineprefix/$PREFIX/drive_c/"
  
cd "$POL_USER_ROOT/wineprefix/$PREFIX/drive_c/"
POL_Download "https://s3.amazonaws.com/shaxpir-installers/install-shaxpir-4.5.12.exe"
 
# Installing Shaxpir
POL_Wine_WaitBefore "$TITLE"
POL_Wine "install-shaxpir-4.5.12.exe"
  
# Make shortcut
POL_Shortcut "Shaxpir.exe" "$TITLE" "" "" "Office;"
  
POL_SetupWindow_message "Shaxpir was successfully installed." "Installation Complete"

POL_SetupWindow_Close
exit 0
