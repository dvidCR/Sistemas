# CMDLET son los comandos
Get-Process
Stop-Process
Get-Date
Get-Host
Get-Command
Get-Command -Name *-Service

# CMDLET con parametros
Get-Process chrome | Format-List *

Write-Host "También funciona esto con echo"

# Leer datos desde el teclado
$nombre = Read-Host "Dime tu nombre"

# Ahora a escribir a la consola el nombre
Write-Host $nombre

# Ayuda
Get-Help Get-Process

Get-Command Get-Process

Get-Alias

Alias

# Esto es como hacer el comando "dir"
Get-ChildItem

# Alias de Get-Process
gps

# Tuberias y redirecciones

Get-Process | Sort-Object Name

Get-Process | Select-Object ProcessName

Get-Process | Select-Object ProcessName -First 5

Get-Process | Sort-Object CPU

Get-Process | Sort-Object WS

Get-Process | Sort-Object PagedMemorySize

Get-Process | Sort-Object Handles -Descending

Get-Process > D:\Clase\Sistemas\PowerShell\30012024.txt
Get-Process >> D:\Clase\Sistemas\PowerShell\30012024.txt

Get-Process | Group-Object Name

Get-Process | Group-Object Name | Select-Object Count

# GT es mayor que
Get-Process | Where-Object CPU -GT 10

#LT es menor que
Get-Process | Where-Object CPU -LT 5

# Variables
$variable = Read-Host "Escribe un texto con al menos 4 palabras"
$variable[0]
$variable[1]
$variable[2]
$variable[3] > D:\Clase\Sistemas\PowerShell\ejRedirección_30012024.txt
$variable[4]

# Comando para abrir y cerrar procesos
Start-Process notepad
Stop-Process -Name notepad

(Get-Command Get-Command).Parameters.Values | Select-Object Name,Aliases

Get-Process | Sort-Object -Property @{E='Name'; A=$False},@{E='CPU';A=$True

(Get-Process).count

# Comparar objetos

Alias gps

$procesosa=gps | Select-Object Name
notepad.exe
$procesosb=gps | Select-Object Name
Compare-Object -ReferenceObject $procesosa -DifferenceObject $procesosb

# Formatos

Get-Process | Format-Custom
Get-Process | Format-Table
Get-Process | Format-List
Get-Process | Format-Wide

# Entrada y Salida

gps | Out-Gridview

# Admistrar servicios ordenados por status

Get-Service | Sort-Object status

# Obtener todos los servicios que esten parados

Get-Service | Where-Object status -eq "stopped"

# Obtener todos los servicios de xbox

Get-Service | Where-Object name -Match "xbox"

# Obtener información de 3 parámetros de Get-Process

Get-Process | Select-Object Name, CPU, WS

# Obtener el cuanto de CPU de uso de la calculadora de Windows en ejecución

calc.exe
Get-Process -name Calculator | Select-Object CPU

# Obtener el tamño de Memoria Virtual que usa la calculadora de Windows en ejecución

calc.exe

# ¿Cómo puedo obtener la ruta de un proceso que se está ejecutando?

Get-Process | Select-Object name, path

# Determinar cuál es el proceso principal de una aplicación

Get-Process -Name ace_engine | Group-Object Name

# Encontrar procesos que consuman mucha CPU

Get-Process | Sort-Object CPU -Descending



$texto1 =  "hola"
$texto2 = "ejemplo"

$texto1 + $texto2

$texto1 = 4
$texto2 = 5
$texto1 + $texto2


$texto = "Texto de cadena"
$texto[0]
$texto.length
$texto.Equals($texto2)

$listaprocesos = Get-Process
$listaprocesos


#Ejemplos de operaciones de entrada y salida:

#Almacenar una palabra en un fichero
'hola' > fichero.txt
#También se puede almacenar con el Cmdlet
'hola' | Out-File fichero.txt

#Leer una palabra de un fichero e imprimir por pantalla
$fichero=Get-Content fichero.txt
Write-Host $fichero

# Redirección de contenido más visualización del mismo

$usuario1 = "Mario"
$usuario1 >> D:\Clase\Sistemas\PowerShell\usuarios.txt

$usuario2 = "Dario"
$usuario2 >> D:\Clase\Sistemas\PowerShell\usuarios.txt

$usuario3 = "Angel"
$usuario3 >> D:\Clase\Sistemas\PowerShell\usuarios.txt

$usuario4 = "Daniel"
$usuario4 >> D:\Clase\Sistemas\PowerShell\usuarios.txt

$usuario5 = "David"
$usuario5 >> D:\Clase\Sistemas\PowerShell\usuarios.txt

Get-Content D:\Clase\Sistemas\PowerShell\usuarios.txt

# Bucles

# Bucle While
$i=1
while($i -lt 11){
$i
$i++
}
 
# Bucle Do-While
$i=1
do{
$i
$i++
}while($i -lt 11)
 
# Bucle For
for($i=1;$i -lt 11;$i++)
{
$i
}
 
# Bucle Foreach
foreach($i in 1..10)
{
$i
}
 
# Bucle Foreach abreviado
1..10 | % {$_}

# Crecion de carpetas y ficheros
new-Item -Path "D:\Clase\Sistemas\PowerShell\pepe" -ItemType Directory

new-Item -Path "D:\Clase\Sistemas\PowerShell\pepe\pepe.txt" -ItemType File

#Copiar
Copy-Item -Path "D:\Clase\Sistemas\PowerShell\pepe\pepe.txt" -Destination "D:\Clase\Sistemas\PowerShell"

#Mover
new-Item -Path "D:\Clase\Sistemas\PowerShell\otro" -ItemType Directory

Move-Item -Path "D:\Clase\Sistemas\PowerShell\pepe.txt" -Destination "D:\Clase\Sistemas\PowerShell\otro"

#Borrar
Remove-Item -Path "D:\Clase\Sistemas\PowerShell\otro\pepe.txt"

#Renombrar
Rename-Item -Path "D:\Clase\Sistemas\PowerShell\pepe\pepe.txt" -NewName "ª.txt"


#Exercise 1: Create a new folder named “MyFiles” in your “Documents” folder.
new-Item -Path "C:\Users\David\Documents\MyFiles" -ItemType Directory

#Exercise 2: Copy all “.txt” files from your “Downloads” folder to your “Documents” folder.
Move-Item -Path "C:\Users\David\Downloads\*.txt" -Destination "C:\Users\David\Documents\MyFiles"

#Exercise 3: Move all “.jpg” files from your “Pictures” folder to a new folder named “Images” in your “Documents” folder.
new-Item -Path "C:\Users\David\Documents\MyFiles\Images" -ItemType Directory
Move-Item -Path "C:\Users\David\Pictures\*.jpg" -Destination "C:\Users\David\Documents\MyFiles\Images"

#Exercise 4: Delete all “.tmp” files in your “Downloads” folder.
Remove-Item -Path "C:\Users\David\Downloads\*.tmp"

#Exercise 5: Rename all “.txt” files in your “Documents” folder by adding a prefix “old_” to the file names.
Get-ChildItem "C:\Users\David\Documents\MyFiles\*.txt" | Rename-Item -NewName {"old_" + $_.Name}