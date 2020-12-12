:s
@echo off
cls
set/p chat=Enter Command:
if %chat% == who_are_you goto who
if %chat% == hello goto hi
if %chat% == hi goto hi
if %chat% == what_is_your_age goto age
if %chat% == cmds goto cmd

:who
echo I am Sancho's Assistant!
pause
goto s

:hi
set/p name=Enter your name:
pause
echo Wow %name%, What a nice name!
pause
goto s

:age
echo I do not have any age as I am ai!
pause
goto s

:cmd
echo who_are_you
echo hello
echo hi
echo what_is_your_age
echo cmds
pause
goto s
