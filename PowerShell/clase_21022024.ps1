Get-Process 

Get-Service

Get-WmiObject -Class Win32_Thread | Select-Object -Property


# abrir la aplicacion notepad
notepad.exe

# ver el proceso asociado a notepad
Get-Process -Name "notepad"

# matar el proceso de notepad
Stop-Process -Name "notepad"

#Mostrar información avanzada de los procesos (Path, ExecutablePath, CommandLine) que se están ejecutando en relación con los servicios y los puertos abiertos TCP
(Get-WmiObject -Class Win32_Service | Where-Object State -EQ 'Running') | %{
#Write-Host $_.Name,$_.ProcessId,$_.State,(Get-Process -Id $_.ProcessId | Select-Object name, Path, ExecutablePath, CommandLine)
Write-Host $_.Name,$_.ProcessId,$_.State,(Get-WmiObject -Class win32_process | Where-Object ProcessId -EQ  $_.ProcessId | select name, Path, ExecutablePath, CommandLine)
Write-Host $_.Name,$_.ProcessId,$_.State,(Get-Process -Id $_.ProcessId).Name,(Get-NetTCPConnection | where OwningProcess -EQ $_.ProcessId | select LocalPort,RemoteAddress,RemotePort,OwningProcess)
Write-Host "##################################################"
}

Get-Process | select cpu, id, name | sort cpu -Descending

foreach($conex in @(netstat -ano))
{
    foreach($proceso in ps)
    {
        if($conex -match $proceso.Id -and $proceso.Id -ne 4 -and $proceso.Id -ne 0)
        {
            write-host $conex "-PROCESO->" $proceso.Name $proceso.Id
        }
    }
}