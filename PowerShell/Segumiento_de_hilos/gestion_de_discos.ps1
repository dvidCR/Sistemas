# Obtener el espacio del disco.
Get-Volume

# También con el comando Get-PSDrive, que muestra más que el Get-Volume.
Get-PSDrive

# Ahora con el comando Get-WmiObject, al cual le pedimos que nos muestre el id del dispositivo, la media, el espacio total y el espacio libre.
Get-WmiObject -Class win32_logicaldisk | Format-Table DeviceId, MediaType, @{n="Tamaño";e={[math]::Round($_.Tamaño/1GB,2)}},@{n="EspacioLibre";e={[math]::Round($_.EspacioLibre/1GB,2)}}

# Este también muestra el nombre del volumen y el porcentaje libre.
Get-WmiObject -Class Win32_LogicalDisk | Select-Object -Property DeviceID, VolumeName, @{Label='Espacio Libre (Gb)'; expression={($_.EspacioLibre/1GB).ToString('F2')}}, @{Label='Total (Gb)'; expression={($_.Tamaño/1GB).ToString('F2')}}, @{label='PorcentajeLibre'; expression={[Math]::Round(($_.espacioLibre / $_.tamaño) * 100, 2)}}|ft

# El siguiente hace lo mismo que el WmiObject pero esta vez con el comando Get-CimInstance.
Get-CimInstance -Class win32_logicaldisk | Format-Table DeviceId, MediaType, @{n="Tamaño";e={[math]::Round($_.Tamaño/1GB,2)}},@{n="EspacioLibre";e={[math]::Round($_.EspacioLibre/1GB,2)}}

# Y esta sería otr manera de hacerlo.
Get-CimInstance -Class Win32_LogicalDisk |Select-Object -Property DeviceID, VolumeName, @{Label='Espacio Libre (Gb)'; expression={($_.EspacioLibre/1GB).ToString('F2')}},@{Label='Total (Gb)'; expression={($_.Tamaño/1GB).ToString('F2')}},@{label='PorcentajeLibre'; expression={[Math]::Round(($_.espacioLibre / $_.tamaño) * 100, 2)}}|ft