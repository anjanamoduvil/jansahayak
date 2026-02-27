@echo off
echo ==========================================
echo       JanSahayak RAM Cleanup Tool 
echo ==========================================
echo.
echo Freeing up RAM for your 7GB system...
echo.

:: Kill standard development resource hogs
echo Killing Dart and Java (Gradle)...
taskkill /F /IM "dart.exe" /T 2>NUL
taskkill /F /IM "java.exe" /T 2>NUL
taskkill /F /IM "adb.exe" /T 2>NUL

:: Optional: Kill browser to save more RAM
:: echo Killing Chrome...
:: taskkill /F /IM "chrome.exe" /T 2>NUL

echo.
echo ==========================================
echo Done! Please run 'flutter run' now.
echo ==========================================
pause
