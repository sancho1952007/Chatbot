@echo off
:s
color f
cls
set/p up=Enter command:
if %up% == hello goto hello
if %up% == who are you goto i
if %up% == hi goto hello
if %up% == how-old-are-you goto no
if %up% == what-is-your-age goto no
if %up% == cmds goto cmds
if %up% == help goto cmds
if %up% == search goto sea
if %up% == exit goto exit
if %up% == name goto i
if %up% == matrix goto mat
if %up% == calc goto cal
if %up% == snakeg1 goto loop
if %up% == ticg1 goto tictac
if %up% == matrixp goto prom
if %up% == trex goto select
echo Wrong command:\
pause
goto s

:hello
set/p name=Please enter your name:
echo Hi %name%! Nice to meet you!
pause
cls
goto s

:i
echo I am the S chatbot!
pause
cls
goto s

:no
echo I am infinite in age as I am ai
pause
cls
goto s

:cmds
echo Note: these codes can also be type in capital leters...
echo 1)hello
echo 2)hi
echo 3)who-are-you
echo 4)how-old-are-you
echo 5)what is your age
echo 6)cmds
echo 7)help
echo 8)search
echo 9)name
echo 10)matrix (for matrix effect)
echo 11)calc (for calculator)
echo 12)snakeg1 (for snake game)
echo 13)ticg1 (for tic tac toe game)
echo 14)matrixp (for matrix effect 2 (pro effect) )
echo 15)trex
echo 16)exit
pause
cls
goto s

:sea
set/p url=Enter url to search:
start chrome %url%
goto s

:exit
exit

:mat
matrix.bat
goto s

:cal
calc.bat
goto s

:loop
snakei.bat

:tictac
ticgame.bat

:prom
rain.html
goto s

:select
cd desktop
cd chatbot.bat
cd trex
index.html
goto s