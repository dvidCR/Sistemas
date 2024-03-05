# Número de hilos
(Get-Process -name notepad | select Threads).Threads.count

# Nombre del proceso que crea los hilos
Get-WmiObject -Class win32_Thread | select ProcessHandle, handle | %{
    Write-Host (get-process -id $_.ProcessHandle).Name, $_.ProcessHandle, $_.handle
}

# Cuenta hilos de cada proceso que se ejecuta
foreach($id in (Get-Process).Id )
{
    (Get-Process -id $id | select Threads).Threads.count
}

# Cuenta los hilos de los procesos por nombre que se ejecutan
foreach($name in (Get-Process).name | Select-Object -Unique )
{
    write-host $name, (Get-Process -name $name | select Threads).Threads.count
}

# Escribe el nombre de los procesos con una expresión
Get-Process | select name, @{Name="nuevonombreclase";Expression={($_.name)+"aso"}}

# Número de hilos por proceso
Get-Process | select Threads,@{Name="numerohilos";Expression={($_.Threads).count}}

# Número de hilos por proceso junto con el nombre del proceso que los crea
Get-Process | select Threads,@{Name="numerohilos";Expression={($_.Threads).count,$_.name}}

#Listar hilos mediante Get-Process
Get-Process | select Name,Threads

#Listar hilos mediante la llamada WMI Win32_Thread
Get-WmiObject -Class Win32_Thread | Select-Object -First 20

#Prioridad de los hilos de los procesos (opción 1)
(Get-WmiObject -Class Win32_Thread) | Select-Object ProcessHandle,Priority,PriorityBase | Sort-Object ProcessHandle

#Prioridad de los hilos de los procesos (opción 2)
(Get-Process).Threads | Select-Object Id,CurrentPriority,BasePriority | Sort-Object Id

#Conocer el estado de los hilos de los procesos (opción 1)
(Get-WmiObject -Class Win32_Thread) | Select-Object ProcessHandle,ThreadState | Sort-Object ProcessHandle

#Conocer el estado de los hilos de los procesos (opción 2)
(Get-Process).Threads | Select-Object Id,ThreadState | Sort-Object Id

#Mostrar los hilos que ejecuta cada proceso
Get-Process | %{
Write-Host $_.Name ($_.Threads).Id
}

#Mostrar el número de hilos que ejecuta cada proceso
Get-Process | %{
Write-Host $_.Name ($_.Threads).Count
}

#Mostrar el proceso que creó el hilo
(Get-WmiObject -Class Win32_Thread).ProcessHandle | %{
Get-Process -Id $_
}

# Con estas líneas listamos los hilos de un proceso.
$name = 'notepad'
$contador=0
foreach($procesoid in (Get-Process -Name $name).Id){
$contador+=((Get-WmiObject -Class Win32_Thread).where{$_.ProcessHandle -match $procesoid}).count
Write-Host 'PID:' $procesoid 'del proceso' $name 'tiene' $contador 'hilos'
$contador=0
}

# Con estas líneas se muestra los hilos de los procesos y servicios que hemos ejecutado.
$i=0
(Get-WmiObject -Class Win32_Thread) | %{
$i++
Write-Host $i,$_.Handle,$_.ProcessHandle,(Get-WmiObject -Class Win32_Service | Where-Object State -EQ 'Running' | Where-Object ProcessId -EQ $_.ProcessHandle),(Get-Process -Id $_.ProcessHandle).ProcessName
}