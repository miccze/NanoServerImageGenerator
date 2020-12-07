<# 
 Skrypt do generacji obrazu Nano Serwera z pliku ISO. 
 Michał Czech 19.01.2018
 
   .SYNOPSIS
        Skrypt generuje obraz serwera NanoSerwer z obrazu ISO Windows Serwera 2016. 
   .DESCRIPTION
        Skrypt generuje obraz Nano Serwera, korzystając z obrazu NanoServer.wim oraz modułu NanoServerImageGenerator, 
        które znajdują się w folderze 'NanoServer' na dysku utworzonym z obrazu Windows Serwera 2016.
    .PARAMETER TARGETDIR
        Lokalizacja docelowa. 
    .PARAMETER ISOPATH
        Lokalizacja pliku ISO Windows Serwera 2016.
    .PARAMETER NANONAME
        Nazwa docelowa pliku z obrazem
    .PARAMETER VHDXdir
        Parametr zależny. Lokalizacja docelowa pliku z wygenerowanym obrazem.
    .PARAMETER NANOSERVERPATH
        Parametr zależny. NanoServerPath to ścieżka do modułu NanoServerImageGenerator oraz do obrazu Nanoserver.wim
#>




#Parametry początkowe
$ISOpath = Read-Host 'Source NanoServer folder location: '
$TARGETDIR = Read-Host 'Destination directory: '
$IMAGEFORMAT = Read-Host 'Target Image format (WIM/VHD/VHDX): '
$NanoName = Read-Host 'Target image name: '

#Parametry zależne:
$VHDXdir = $TARGETDIR+"\"+$NanoName+"\" + $IMAGEFORMAT+"\" +$NanoName+"." + $IMAGEFORMAT   #$VHDXdir to lokalizacja w której docelowa obrazu. Rozszerzenie pliku na końcu tej ścieżki determinuje czy ma to być VHDX czy VHD
  

#Montowanie obrazu
Mount-DiskImage –ImagePath $isopath

$driveletter = (get-diskimage $isopath | get-volume).driveletter + ":"
$NanoServerPath = $driveletter+"\NanoServer" # $NanoServerPath to ścieżka do modułu NanoServerImageGenerator oraz do obrazu Nanoserver.wim

#Generacja obrazu
cd $NanoServerPath
Import-Module .\NanoServerImageGenerator -Verbose
New-NanoServerImage -Edition Standard -DeploymentType Guest -MediaPath $driveletter -TargetPath $VHDXdir -ComputerName $NanoName