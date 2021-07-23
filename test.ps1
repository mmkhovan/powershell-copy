param (
    [String]$source_dir,
	[String]$destination_dir,
	[String]$search_str
)
$FolderContent = (Get-ChildItem -Path $source_dir -Filter '*.txt')
$FolderContent
for ($i=0; $i -lt $FolderContent.Count; $i++) {
$OCSlatest = $FolderContent[$i].FullName
if ($OCSlatest) {
    $OCSlatest
    $search = (Get-Content $OCSlatest | Select-String -Pattern $search_str).Matches.Success
    if($search){
        "Success"
		Copy-Item $OCSlatest -Destination $destination_dir
    } else {
        "Fail"
    }
}
else {
    "no files with certain pattern"
	$i.fullname
}
}
