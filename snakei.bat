@echo off
setlocal ENABLEDELAYEDEXPANSION
set copyright=Pawel Srokosz [psrok1] ^(C^) 2012
set maxx=70
set maxy=20
mode con:lines=30
goto main

:initvga
set vgaclear=                                                                              
for /L %%i in (1,1,25) do set vga%%i=!vgaclear!
goto :EOF

:putchar
rem ARGUMENTS: x y char
set /A tmpxa=%1-1
set /A tmpxb=%1
set vga%2=!vga%2:~0,%tmpxa%!%3!vga%2:~%tmpxb%!
goto :EOF

:drawvga
for /L %%i in (1,1,25) do if !vga%%i!==!vgaclear! ( echo. ) else (echo !vga%%i!)
goto :EOF

:initplayer

set /A pcount=1 >nul
set /A pdir=1 >nul
set /A px1=!RANDOM!%%19+1 >nul
set /A py1=!RANDOM!%%19+1 >nul
:initplayer.WHILE000
set /A fx=!RANDOM!%%19+1 >nul
set /A fy=!RANDOM!%%19+1 >nul
if !fx! EQU !px1! goto initplayer.WHILE000
if !fy! EQU !py1! goto initplayer.WHILE000 
GOTO :EOF

:moveplayer
if !pcount! LEQ 1 goto moveplayer_FOREND
set /A iter0=!pcount!
set /A iter1=!pcount!-1
:moveplayer_FORSTART
set px%iter0%=!px%iter1%!
set py%iter0%=!py%iter1%!
set /A iter0-=1
set /A iter1-=1
if !iter0! NEQ 1 goto moveplayer_FORSTART
:moveplayer_FOREND
rem W
if !pdir! EQU 1 set /A py1-=1
rem S
if !pdir! EQU 2 set /A py1+=1
rem A
if !pdir! EQU 3 set /A px1-=1
rem D
if !pdir! EQU 4 set /A px1+=1
if !px1! LSS 1 set /A px1=!maxx!
if !py1! LSS 1 set /A py1=!maxy!
if !px1! GTR !maxx! set /A px1=1
if !py1! GTR !maxy! set /A py1=1 

GOTO :EOF

:ctrlplayer

set result=0
if !pcount! GTR 1 for /L %%i in (2,1,!pcount!) do (
	if !px%%i! EQU !px1! if !py%%i! EQU !py1! set result=1
)
if !result! EQU 1 GOTO :EOF

if !px1! EQU !fx! if !py1! EQU !fy! set result=2
if !result! EQU 2 (
	set /A fx=!RANDOM!%%19+1 >nul
	set /A fy=!RANDOM!%%19+1 >nul
	set /A pcount=!pcount!+1 >nul
	set px!pcount!=0
	set py!pcount!=0
	call :moveplayer
)
GOTO :EOF

:xpchoice
set /p userinp=^(W,S,A,D,X?^)
set userinp=%userinp:~0,1%
if "%userinp%" == "W" set userinp=1
if "%userinp%" == "w" set userinp=1
if "%userinp%" == "S" set userinp=2
if "%userinp%" == "s" set userinp=2
if "%userinp%" == "A" set userinp=3
if "%userinp%" == "a" set userinp=3
if "%userinp%" == "D" set userinp=4
if "%userinp%" == "d" set userinp=4
if "%userinp%" == "X" set userinp=5
if "%userinp%" == "x" set userinp=5
GOTO :EOF
:inputplayer

rem W
if !pdir! EQU 1 set defc=W
rem S
if !pdir! EQU 2 set defc=S
rem A
if !pdir! EQU 3 set defc=A
rem D
if !pdir! EQU 4 set defc=D
choice /C WSADX /D !defc! /T 1
set pdir=!ERRORLEVEL!
GOTO :EOF

:drawview
cls
set /A tmpp=(!pcount!-1)*10
echo !copyright! --- Points: !tmpp!
call :initvga
for /L %%i in (1,1,!pcount!) do call :putchar !px%%i! !py%%i! *
call :putchar !fx! !fy! x
call :drawvga
GOTO :EOF

:main
call :initplayer
:mainloop
call :drawview
call :inputplayer
if !pdir! EQU 5 goto terminate
call :moveplayer
call :ctrlplayer
if !result! EQU 1 goto terminate
goto mainloop
goto terminate
:terminate
endlocal
echo terminated.