function buckup ($rutaOrigen, $rutaDestino) {
    Get-ChildItem $rutaOrigen | Select-Object Name 

    Get-FileHash "D:\Clase\Sistemas\*" > "C:\Temp\watchdog.txt"

    Move-Item -Path "C:\Temp\watchdog.txt" -Destination "C:\Users\David\Documents\Sprite" -Force

    $aux = $rutaOrigen + "\*"
    $aux2 = $rutaDestino + "\buckup.zip"

    Compress-Archive -Path $aux -DestinationPath $aux2 -Force
}

buckup "C:\Users\David\Documents\Sprite" "C:\Users\David\Documents"