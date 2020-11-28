:cal
@echo off
cls
set/p calc=Enter number to be calculated:
set/a sol=%calc%
echo Answer:%sol%
pause
cls
echo 1)Go to chatbot
echo 2)Exit
set/p opt=
if %opt% == 1 goto exit
if %opt% == 2 goto cal

:exit
chatbot.bat