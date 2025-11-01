@echo off

echo Removing Soteria Data Directories...

rmdir /s /q "%APPDATA%\Soteria\blocks"
if errorlevel 1 (
    echo ERROR: Failed to remove blocks directory.
    pause
    exit /b
)

timeout /t 1 /nobreak > NUL

rmdir /s /q "%APPDATA%\Soteria\chainstate"
if errorlevel 1 (
    echo ERROR: Failed to remove chainstate directory.
    pause
    exit /b
)

timeout /t 1 /nobreak > NUL

rmdir /s /q "%APPDATA%\Soteria\messages"
if errorlevel 1 (
    echo ERROR: Failed to remove messages directory.
    pause
    exit /b
)

timeout /t 1 /nobreak > NUL

rmdir /s /q "%APPDATA%\Soteria\assets"
if errorlevel 1 (
    echo ERROR: Failed to remove assets directory.
    pause
    exit /b
)

timeout /t 1 /nobreak > NUL

echo Downloading Bootstrap...
curl -LJO https://github.com/Soteria-Network/Soteria-Bootstrap/archive/refs/tags/10-01-2026.zip
if errorlevel 1 (
    echo ERROR: Failed to download bootstrap file.
    pause
    exit /b
)

echo Extracting Bootstrap...
unzip "Soteria-Bootstrap-10-01-2026.zip"
if errorlevel 1 (
    echo ERROR: Failed to unzip bootstrap archive.
    pause
    exit /b
)

timeout /t 1 /nobreak > NUL

echo Copying Bootstrap files...
cd "Soteria-Bootstrap-10-01-2026"
if errorlevel 1 (
    echo ERROR: Failed to enter bootstrap folder.
    pause
    exit /b
)

copy /Y bootstrap.* "%APPDATA%\Soteria"
if errorlevel 1 (
    echo ERROR: Failed to copy bootstrap files.
    pause
    exit /b
)

cd "%APPDATA%\Soteria"
if errorlevel 1 (
    echo ERROR: Failed to switch to Soteria data directory.
    pause
    exit /b
)

echo Extracting bootstrap.zip...
unzip -o bootstrap.zip
if errorlevel 1 (
    echo ERROR: Failed to extract bootstrap.zip.
    pause
    exit /b
)

timeout /t 1 /nobreak > NUL

echo Bootstrapping complete. Start the Soteria QT wallet and wait for it to sync.
pause
