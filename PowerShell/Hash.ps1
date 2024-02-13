foreach($file in Get-ChildItem "D:\Clase\Sistemas") {

    Write-Host "D:\Clase\Sistemas\" - join $file
    Get-FileHash "D:\Clase\Sistemas\" + $file

}

Get-FileHash "D:\Clase\Sistemas\*"