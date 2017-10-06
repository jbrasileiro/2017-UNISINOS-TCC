@echo off
set vr_winrarPath="C:\Program Files\WinRAR"
set vr_winrar=%vr_winrarPath%\WinRAR.exe

set vr_fileName=TCC.ProjetoFinal.Monografia
set vr_fileExt=.pdf
set vr_file=%vr_fileName%%vr_fileExt%
set vr_ZipfileName=TCC.Monografia
set vr_ZipExt=.rar

set vr_bkpdf=.\PDF
set vr_bkppathTemp=c:\BackUpFiles
set vr_bkppath=.\BackUp

SETLOCAL
for /F "tokens=2,3,4 delims=/ " %%i in ('date /t') do set d=%%k%%j%%i
  For /f "tokens=1-3 delims=1234567890 " %%a in ("%time%") Do set "delims=%%a%%b%%c"
  For /f "tokens=1-4 delims=%delims%" %%G in ("%time%") Do (
    Set _hh=%%G
    Set _min=%%H
    Set _ss=%%I
    Set _ms=%%J
  )
if %_hh% LSS 10 set _hh=0%_hh%
set t=%_hh%.%_min% 

::set t=%t%
::if "%t:~3,1%"=="_" set t=0%t%
::set t=%t:~0,4%

set "filename=%d%-%t%"
Set filename=%filename: =%

echo %filename%
copy %vr_file% %vr_bkpdf%\%vr_fileName%.%filename%%vr_fileExt%


xcopy *.* %vr_bkppathTemp% /chiskq
RMDIR %vr_bkppathTemp%\BackUp /s /q
RMDIR %vr_bkppathTemp%\PDF /s /q
RMDIR %vr_bkppathTemp%\Scripts /s /q

%vr_winrar% a "%vr_bkppath%\%vr_ZipfileName%%filename%%vr_ZipExt%" %vr_bkpTemp% -m5
RMDIR %vr_bkppathTemp% /s /q