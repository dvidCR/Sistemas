Import-Module -Name ".\FileCryptography.psm1"
$key = New-CryptographyKey -Algorithm AES -AsPlainText

New-Item -Path "./Ejercicio3/ejemplo.txt" -ItemType File
New-Item -Path "./Ejercicio3/saludo.txt" -ItemType File
New-Item -Path "./Ejercicio3/ejemplo.txt" -ItemType File
New-Item -Path "./Ejercicio3/archivoSecreto.txt" -ItemType File
New-Item -Path "./Ejercicio3/archivo_seguridad.txt" -ItemType File

function compress ($archivo) {

    Compress-Archive -Path $archivo -DestinationPath ".\Ejercicio3\archivos_comprimidos" -Force
}

compress "./Ejercicio3/ejemplo.txt"

function escribir ($fichero) {

    Set-Content -Path $fichero -Value "Hola, mundo!"
}

escribir "./Ejercicio3/saludo.txt"

function encript ($fichero) {
    
    Protect-File $fichero -Algorithm AES -KeyAsPlainText $key -RemoveSource
}

encript "./Ejercicio3/archivoSecreto.txt"
encript "./Ejercicio3/archivo_seguridad.txt"

function readEncript ($fichero) {
    
    Get-FileHash $fichero -Algorithm SHA384 | Format-List
}

readEncript "./Ejercicio3/archivo_seguridad.txt.AES"