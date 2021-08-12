# checkCodec.ps1
# FFmpeg: 2021-03-09-git-c35e456f54-full_build-www.gyan.dev

$path = $PSCommandPath | Split-Path -Parent

$extensionArray = "avi", "mkv", "mp4", "flv"

foreach ($extension in $extensionArray)
{
    foreach ($FILENAME in Get-ChildItem -Path $path -Filter "*.$extension") {
        $codecType = ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 $path"\"$FILENAME
        Write-Output "$FILENAME => $codecType"
    }
}