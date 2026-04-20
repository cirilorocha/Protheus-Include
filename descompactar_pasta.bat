%~d0
CD %~dp0

FOR %%i in ("%~1\*.ch") do "%~dp0\decompress_includes.exe" "%%i"
FOR %%i in ("%~1\*.th") do "%~dp0\decompress_includes.exe" "%%i"
