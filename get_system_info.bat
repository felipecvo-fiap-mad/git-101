@echo off

REM Define log and output files
set LOGFILE=execution.log
set OUTPUTFILE=systeminfo.txt

REM Start logging
echo Starting system information retrieval... > %LOGFILE%

REM Run systeminfo command and log the step
echo Running systeminfo command... >> %LOGFILE%
systeminfo > %OUTPUTFILE%
echo systeminfo command completed. Output saved to %OUTPUTFILE%. >> %LOGFILE%

REM Run wmic CPU command and log the step
echo Running wmic CPU command... >> %LOGFILE%
wmic cpu get name, NumberOfCores, NumberOfLogicalProcessors >> %OUTPUTFILE%
echo wmic CPU command completed. Output appended to %OUTPUTFILE%. >> %LOGFILE%

REM Run wmic OS command and log the step
echo Running wmic OS command... >> %LOGFILE%
wmic os get Caption, OSArchitecture, Version >> %OUTPUTFILE%
echo wmic OS command completed. Output appended to %OUTPUTFILE%. >> %LOGFILE%

REM Finalize logging
echo System information retrieval completed successfully. >> %LOGFILE%
echo All outputs have been saved to %OUTPUTFILE%. >> %LOGFILE%

echo Done! Log file generated at %LOGFILE%.
