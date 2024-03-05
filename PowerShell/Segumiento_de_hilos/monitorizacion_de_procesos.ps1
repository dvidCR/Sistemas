# Este codigo esta a la escucha de nuevos procesos y cuando los vea lo muestra en pantalla.
$procesos = Get-Process
# Este bucle for es un bucle infinito, basicamente la única manera de pararlo es de manera manual.
for(1)
{
    # Cada vez que comienza de nuevo espera un segundo por si ahi nuevos procesos
    Start-Sleep -Seconds 1
    $procesos2 = Get-Process
    # Esta variable lo que hace es comparar ambos id de los procesos.
    $nuevosprocesos = (Compare-Object -ReferenceObject $procesos -DifferenceObject $procesos2 -Property id).id
    $nuevosprocesos
    # Este bucle foreach busca el nombre del proceso mediante el id que hemos sacado antes.
    foreach($proceso in $nuevosprocesos){(Get-Process -Id $proceso).ProcessName}
    # Aqui volvemos a refrescar el Get-Process con los "nuevos" procesos para volverla a comparar.
    $procesos = Get-Process
}