New-Item -Path "D:\Clase\Sistemas\TechApp" -ItemType Directory

Copy-Item -Path "D:\Clase\.vscode" -Destination "D:\Clase\Sistemas"

Move-Item -Path "D:\Clase\.vscode" -Destination "D:\Clase\Sistemas" 

Remove-Item -Path "D:\Clase\.vscode"

Get-ChildItem -Path "D:\Clase\Sistemas" -Name "*.txt" | Measure-Object | %{$_.Count}

Rename-Item -Path "D:\Clase\Sistemas" -NewName "a"

Get-LocalUser | Where-Object Enabled

Get-Process -Name sqlwriter

Get-Service -Name AarSvc_c9716e4

###
# Pregunta4 del ejercicio 3
foreach($conex in @(netstat -ano)) { foreach($proceso in ps) { if($conex -match $proceso.Id -and $proceso.Id -ne 4 -and $proceso.Id -ne 0) { write-host $conex "-PROCESO->" $proceso.Name $proceso.Id } } }
###

Stop-Process -name "notepad"

Get-Process -Name chrome | Select-Object -ExpandProperty Threads