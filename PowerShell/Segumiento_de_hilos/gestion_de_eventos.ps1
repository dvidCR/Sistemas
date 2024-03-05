# Muestra en una lista todos los eventos.
Get-EventLog -List

# En este mostramos los cinco eventos más recientes.
Get-EventLog -LogName System -Newest 5

# Este muestra todos los eventos que han dado error.
Get-EventLog -LogName System -EntryType Error

# En este sacamos los 10 errores más recientes filtrados por la palabra clave "dominio".
Get-EventLog -LogName System -EntryType Error -Newest 10 -Message *dominio*

# En este muestra las propiedad del evento con el identificador 65271.
Get-EventLog -LogName System -Index 65271 | Select-Object -Property *

# En estra muestra las propiedades del evento más reciente.
Get-EventLog -LogName System -Newest 1 | Select-Object -Property *

# En las siguientes listas filtramos los eventos que han surgido durante un periodo de tiempo.
$Begin = Get-Date -Date '9/19/2021 08:00:00'
$End = Get-Date -Date '9/20/2021 17:00:00'
Get-EventLog -LogName System -EntryType Error -After $Begin -Before $End