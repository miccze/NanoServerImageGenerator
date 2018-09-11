<# 
 Skrypt do generacji obrazu Nano Serwera po sieci, z volta. 
 Michał Czech 19.01.2018
 
   .SYNOPSIS
        Skrypt generuje obraz serwera NanoSerwer ze ścieżki sieciowej. 
   .DESCRIPTION
        Skrypt generuje obraz Nano Serwera, korzystając z obrazu NanoServer.wim oraz modułu NanoServerImageGenerator, 
        które znajdują się w folderze 'NanoServer'.
    .PARAMETER TARGETDIR
        Lokalizacja docelowa. 
    .PARAMETER SOURCEPATH
        Lokalizacja folderu NanoServer z obrazem NanoServer.wim oraz modułem NanoServerImageGenerator.
    .PARAMETER NANONAME
        Nazwa docelowa pliku z obrazem
    .PARAMETER VHDXdir
        Parametr zależny. Lokalizacja docelowa pliku z wygenerowanym obrazem.
    .PARAMETER NANOSERVERPATH
        Parametr zależny. NanoServerPath to ścieżka do modułu NanoServerImageGenerator oraz do obrazu Nanoserver.wim
#>


#Parametry początkowe:
$SourcePath = Read-Host 'Source NanoServer folder location: '
$TARGETDIR = Read-Host 'Destination directory: '
$IMAGEFORMAT = Read-Host 'Target Image format (WIM/VHD/VHDX): '
$NanoName = Read-Host 'Target image name: '

#Parametry zależne:
$VHDXdir = $TARGETDIR+"\"+$NanoName+"\" + $IMAGEFORMAT +"\"+$NanoName+"." + $IMAGEFORMAT
$NanoServerPath = $SourcePath+"\NanoServer"

#Generacja obrazu
Set-Location $NanoServerPath
Import-Module .\NanoServerImageGenerator -Verbose
New-NanoServerImage -Edition Standard -DeploymentType Guest -MediaPath $SourcePath -TargetPath $VHDXdir -ComputerName $NanoName