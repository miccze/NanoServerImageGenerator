# Powershell-scripts by Michal Czech
# Scripts Convert-WindowsImage.ps1 and NanoServerImageGenerator.psm1 are modified Microsoft scripts. I did it to optimalize process of Nano Server image generation. I have removed unnecessary copying of files to temp location and therefore shortened the time needed for generation of the image. This is especially usefull for Nano Server image generation over network, using files from centralised location on some share. 
# In order to use them just replace original scripts in ../NanoServer/NanoServerImageGenerator with scripts from this repository. You should replace script Conver-WindowsImage.ps1 and module NanoServerImageGenerator.psm1 
# Script Nano_image_over_network.ps1 is used to trigger the generation process. 
