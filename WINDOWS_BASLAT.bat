@echo off
title ResVPN - Windows Hazirlik
echo.
echo =============================================
echo   ResVPN - Windows IPA Hazirlama Paketi
echo =============================================
echo.
echo 1) GitHub'da yeni bir repository olustur.
echo 2) Bu klasordeki TUM dosyalari repository'ye yukle.
echo 3) GitHub ^> Actions ^> Build ResVPN IPA ^> Run workflow.
echo 4) Islem bitince ResVPN-IPA artifact'ini indir.
echo 5) ZIP icinden ResVPN-unsigned.ipa dosyasini cikart.
echo 6) AltStore Classic ile iPhone'a kur.
echo.
echo GitHub aciliyor...
start https://github.com/new
pause
