# mp42M4aConverter.ps1
# FFmpeg: 2021-03-09-git-c35e456f54-full_build-www.gyan.dev

$path = $PSCommandPath | Split-Path -Parent

foreach ($FILENAME in Get-ChildItem -Path $path -Filter "*.mp4") {
    Write-Output "Working: $FILENAME"
    [string]$output_file_name = $FILENAME.name.split('\.')[0]
    ffmpeg -i $path"\"$FILENAME -c copy -map 0:a:0 $path"\"$output_file_name".m4a"
}