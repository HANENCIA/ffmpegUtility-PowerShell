# addResolutionRenamerImage.ps1
# FFmpeg: 2021-03-09-git-c35e456f54-full_build-www.gyan.dev

$path = $PSCommandPath | Split-Path -Parent

$extensionArray = "jpg", "png"

foreach ($extension in $extensionArray)
{
    foreach ($FILENAME in Get-ChildItem -Path $path -Filter "*.$extension") {
        Write-Output "Working: $FILENAME"
        $width, $height = ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1:nk=1 $path"\"$FILENAME
        $FILENAME | Rename-Item -NewName {$_.basename + " (" + $width + $([char]0x00D7) + $height + ")." + $extension}
    }
}