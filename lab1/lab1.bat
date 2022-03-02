@ECHO OFF
CLS
ECHO File %0 copyies from %1 to %2
IF -%1==- GOTO NoParam
IF -%2==- GOTO NoParam
XCOPY %1\*.txt %2 /D:01-2-2013
GOTO :eof
:NoParam
ECHO Unknown path
PAUSE