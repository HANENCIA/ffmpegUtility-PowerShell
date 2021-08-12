# avi2Mp4Converter.ps1
# FFmpeg: 2021-03-09-git-c35e456f54-full_build-www.gyan.dev

$path = $PSCommandPath | Split-Path -Parent

foreach ($FILENAME in Get-ChildItem -Path $path -Filter "*.avi") {
    Write-Output "Working: $FILENAME"
    [string]$outputFileName = $FILENAME.name.split('\.')[0]
    ffmpeg -i $path"\"$FILENAME -map 0 -c:v libx264 -c:a copy $path"\"$outputFileName".mp4"
}