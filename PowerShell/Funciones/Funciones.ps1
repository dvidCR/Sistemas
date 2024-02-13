function prueba ($programa, $nombre){

    Get-Process -Name $programa
    Write-Host $nombre

}

prueba "chrome" "Hola mundo"