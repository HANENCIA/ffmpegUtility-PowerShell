# addResolutionRenamer.ps1
# FFmpeg: 2021-03-09-git-c35e456f54-full_build-www.gyan.dev

$path = $PSCommandPath | Split-Path -Parent

# .avi
foreach ($FILENAME in Get-ChildItem -Path $path -Filter "*.avi") {
    Write-Output "Working: $FILENAME"
    $width, $height = ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1:nk=1 $path"\"$FILENAME
    $FILENAME | Rename-Item -NewName {$_.basename + " (" + $width + $([char]0x00D7) + $height + ").avi"}
}

# .mkv
foreach ($FILENAME in Get-ChildItem -Path $path -Filter "*.mkv") {
    Write-Output "Working: $FILENAME"
    $width, $height = ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1:nk=1 $path"\"$FILENAME
    $FILENAME | Rename-Item -NewName {$_.basename + " (" + $width + $([char]0x00D7) + $height + ").mkv"}
}

# .mp4
foreach ($FILENAME in Get-ChildItem -Path $path -Filter "*.mp4") {
    Write-Output "Working: $FILENAME"
    $width, $height = ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1:nk=1 $path"\"$FILENAME
    $FILENAME | Rename-Item -NewName {$_.basename + " (" + $width + $([char]0x00D7) + $height + ").mp4"}
}