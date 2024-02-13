$key = New-CryptographyKey -Algorithm AES -AsPlainText

#Protect-File 'D:\Clase\Sistemas\PowerShell\Criptografia\fichero.txt' -Algorithm AES -Key $key -RemoveSource

#Unprotect-File 'D:\Clase\Sistemas\PowerShell\Criptografia\fichero.txt.AES' -Algorithm AES -Key $key -RemoveSource

function buckup ($rutaOrigen, $rutaDestino) {
    $nombre = Get-ChildItem $rutaOrigen | Select-Object 

    Get-FileHash "D:\Clase\Sistemas\*" > "C:\Temp\watchdog.txt"

    Move-Item -Path "C:\Temp\watchdog.txt" -Destination "C:\Users\David\Documents\Sprite" -Force

    $aux = $rutaOrigen + "\*"
    $aux2 = $rutaDestino + "\buckup.zip"

    Compress-Archive -Path $aux -DestinationPath $aux2 -Force

    Protect-File $aux2 -Algorithm AES -KeyAsPlainText $key -RemoveSource
}

buckup "C:\Users\David\Documents\Sprite" "C:\Users\David\Documents"

#Unprotect-File 'C:\Users\David\Documents\buckup.zip.AES' -Algorithm AES -KeyAsPlainText $key -RemoveSource