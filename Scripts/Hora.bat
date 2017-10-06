@echo on
SETLOCAL
for /F "tokens=1,2,3 delims=/ " %%i in ('date/t') do set d=%%k%%j%%i
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




pause