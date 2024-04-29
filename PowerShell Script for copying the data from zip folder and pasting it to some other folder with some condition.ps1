# Set the path to your zip file
$zipFilePath = "C:\Users\admin\Downloads\NoPath - Copy (59).zip"

# Set the path to the destination folder where you want to copy the images
$destinationFolder = "C:\Users\admin\Downloads\Pharmacology"

# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -Path $destinationFolder -ItemType Directory | Out-Null
}

# Extract the zip file
$extractedFolder = Join-Path -Path $destinationFolder -ChildPath "ExtractedImages"
Expand-Archive -Path $zipFilePath -DestinationPath $extractedFolder -Force

# Get all image files in the extracted folder excluding those with '@' in their names
$imageFiles = Get-ChildItem -Path $extractedFolder -Recurse -Include "*.jpg", "*.jpeg", "*.png", "*.gif" | Where-Object { $_.Name -notlike '*@*' }

# Move each image file to the destination folder
foreach ($imageFile in $imageFiles) {
    $newFilePath = Join-Path -Path $destinationFolder -ChildPath $imageFile.Name
    Move-Item -Path $imageFile.FullName -Destination $newFilePath -Force
}

Write-Host "Images extracted and copied to $destinationFolder"
