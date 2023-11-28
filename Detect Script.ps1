$File = "C:\Windows\system32\DriverStore\FileRepository\hpcu270u.inf_amd64_3e20dbae029ad04a"
if (Test-Path $File) {
    write-output "HP UPD Detected"
    exit 0
}
else {
    exit 1
}