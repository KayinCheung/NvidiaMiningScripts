echo "Checking if GPUs are hashing..."
@echo off
for /L %%n in (1,0,100) do (
timeout /T 600 /NOBREAK
cd C:\Program Files\NVIDIA Corporation\NVSMI\
nvidia-smi --format=csv,noheader --query-gpu=power.draw > C:\Users\a\Desktop\temperature.txt
cd C:\Users\a\Desktop
for /F "tokens=1 delims=." %%A in (temperature.txt) do (
timeout /T 10 /NOBREAK
if %%A lss 60 (
cd C:\Users\a\Dropbox
echo %date% %time% %1 " --GPU inactive" >> inactive.txt
shutdown.exe /r
goto eof

)
) 
)

:eof
pause