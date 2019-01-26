del /F /Q game
copy /b love.exe+%1 "%~n1.exe"
mkdir game
copy dlls game
move "%~n1.exe" "game/%~n1.exe"