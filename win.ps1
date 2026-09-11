$folder = "$env:TEMP\JindoMultiTool"
$bat = "$folder\main_webver.bat"

New-Item -ItemType Directory -Path $folder -Force | Out-Null

Invoke-WebRequest `
    -Uri "https://ltv-jindo.github.io/host/main_webver.bat" `
    -OutFile $bat

Start-Process "cmd.exe" -ArgumentList "/c `"$bat`""
