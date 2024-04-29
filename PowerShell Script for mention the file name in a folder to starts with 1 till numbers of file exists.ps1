# Set the path to your folder containing the files
$folderPath = "C:\Users\admin\Downloads\Physiology"

# Get all the files in the folder
$files = Get-ChildItem -Path $folderPath

# Initialize a counter
$count = 1

# Loop through each file and rename them
foreach ($file in $files) {
    # Get the file extension
    $extension = $file.Extension
    
    # Construct the new file name
    $newName = "$($count)$extension"
    
    # Rename the file
    Rename-Item -Path $file.FullName -NewName $newName
    
    # Increment the counter
    $count++
}
