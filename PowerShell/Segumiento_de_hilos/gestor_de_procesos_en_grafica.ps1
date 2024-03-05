# Borrar gráfico anterior si existe y si no lo crea igualmente pero muestra un mensaje de error.
try { 
    rm -Path "D:\Clase\Sistemas\PowerShell\Segumiento_de_hilos\grafico.html" -ErrorAction Stop
}
catch {
    Write-Host "El fichero no existe, se procede a crearlo"
}

$datos = "["

# Este bucle foreach dura hasta que haya pasado por todos los procesos.
foreach($proceso in (Get-Process | Sort-Object -Descending name ))
{
    # Este if lo que comprueba es que si el proceso usa cpu, si sale vacio pasa el nombre del proceso y con un 0 para mostrar que no hay uso de la cpu.
    if(!$proceso.cpu)
    {
        $datos += "['"+ $proceso.name +"', 0],"    
    }
    # Y si hay consumo de cpu pasas el nombre y cuanto de cpu esta consumiendo ese proceso.
    else
    {
        $datos += "['"+ $proceso.name +"', "+$proceso.cpu+"],"
    }
    
}

$datos += "]"
# Esta variable nos vale para borrar los corchetes de la variable datos.
$datos = $datos.Replace("],]","]]")

# En esta variable creamos un texto HTML en el que de manera rápida es para crear la gráfica mediante javascript.
$inicio="<head>
  <script src=""https://www.gstatic.com/charts/loader.js""></script>
  <script>
    google.charts.load('current', {packages: ['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      // Define the chart to be drawn.
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Proceso');
      data.addColumn('number', 'Consumo CPU en segundos');
      data.addRows("+$datos+");

      var options = {'title':'La cantidad de tiempo de procesador que el proceso ha utilizado en todos los procesadores, en segundos','width':1200,'height':2000};

		// Instantiate and draw the chart.
		var chart = new google.visualization.BarChart(document.getElementById('myPieChart'));
		chart.draw(data, options);
		}
		</script>
</head>
<body>
<!-- Identify where the chart should be drawn. -->
<div id=""myPieChart""></div>
</body>"

# Aqui pillamos el texto del html y lo metemos en un fichero html que acabamos de crear en esta misma linea.
$inicio | Out-File D:\Clase\Sistemas\PowerShell\Segumiento_de_hilos\grafico.html -Encoding default -Append