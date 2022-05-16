@set VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio 12.0
@set QT_PATH=D:\opt\Qt\qt-5.8.0\msvc2013_64\bin
@call "%VS_PATH%\VC\bin\amd64\vcvars64.bat"
@set THIRDLIB_PATH=..\..\..\thirdparty
@cd /d %~dp0\..
@set TCL_LIBRARY=%THIRDLIB_PATH%\Windows\tcl\tcl8.4
@set PATH=%THIRDLIB_PATH%\dll;%PATH%
%QT_PATH%\qmake -spec win32-msvc2013 .qmake.cache.pro
%QT_PATH%\qmake -recursive -spec win32-msvc2013 -tp vc firrtlsyn.pro CONFIG+=console %*
"%VS_PATH%\Common7\IDE\devenv.exe" firrtlsyn.sln 

