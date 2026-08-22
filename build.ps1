$managerProject = "$PSScriptRoot/BananaModManager"
$outputDir = "$PSScriptRoot/publish"
Remove-Item -Recurse -Force "$outputDir" -ErrorAction Ignore

Write-Host "Building Banana Mod Manager..."
dotnet publish $managerProject -c Release -r linux-x64 --self-contained true /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true -o "$outputDir/linux"
dotnet publish $managerProject -c Release -r win-x64 --self-contained true /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true -o "$outputDir/windows"

Write-Host "`nPublish complete!"
Write-Host "Linux build: $outputDir/linux"
Write-Host "Windows build: $outputDir/windows"
