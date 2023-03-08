FORFILES /P %1 /M *.ch /C "CMD /c %~dp0\decompress_includes.exe @FILE"
FORFILES /P %1 /M *.th /C "CMD /c %~dp0\decompress_includes.exe @FILE"