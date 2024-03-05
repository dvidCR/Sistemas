# Crea un proceso en segundo plano.
Start-Job -ScriptBlock {Get-Process}
Receive-Job 3
Get-Job *

# Muestra en un bucle infinito el número de procesos de power sell que hay.
while(1)
{
    (Get-Process -Name powershell).count
}