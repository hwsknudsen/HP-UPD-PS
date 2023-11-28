$source = "https://ftp.hp.com/pub/softlib/software13/printers/UPD/"
$version = "upd-pcl6-x64-7.1.0.25570"
$destination = "c:\TempHPUPD\"
$drivertestpath = "C:\Windows\system32\DriverStore\FileRepository\hpcu270u.inf_amd64_3e20dbae029ad04a"

#Check if software is installed. If installed terminate script
if ((Test-Path "c:\TempHPUPD\$version") -Or (Test-Path $drivertestpath)){
write-host "Software already installed" 
Exit
}

#install software
mkdir $destination
Invoke-WebRequest ($source+$version+".exe") -OutFile ($destination+$version+".zip")
Expand-Archive ($destination+$version+".zip") -DestinationPath ($destination+$version)

#Start-Process -FilePath ($destination+$version+"\Install.exe") -ArgumentList "/infremove /q /h" -Wait
Start-Process -FilePath ($destination+$version+"\Install.exe") -ArgumentList "/infstage /q /h" -Wait

#Delete installer
Remove-Item -recurse $destination