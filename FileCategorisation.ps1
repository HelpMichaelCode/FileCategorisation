# Base Path but can be changed depending on what folder you want the
# script to oragnise
$BasePath = "$env:OneDrive\Documents"

$Files = Get-ChildItem $BasePath -File 

foreach ($File in $Files) {

    $Extension = $File.Extension.TrimStart('.').ToUpper()

    # Handle files with no extension and replace 
    # with a value of "Other-RandomNumber"
    if ([string]::IsNullOrEmpty($Extension)) {
        
        $ID = Get-Random 
        $Extension = "Other-$ID"

    }

    # Create the destination folder path
    $DestinationFolder = Join-Path $BasePath $Extension
    
    # Create the folder if it has not been created yet
    if (-not (Test-Path $DestinationFolder)) {
            New-Item -ItemType Directory -Path $DestinationFolder
        }

    # Move the file into the folder
    Move-Item -Path $File.FullName -Destination $DestinationFolder
}