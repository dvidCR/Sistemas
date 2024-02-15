function crear($usuario, $contraseña) {
    New-LocalUser $usuario -Password(ConvertTo-SecureString $usuario -AsPlainText -Force) -FullName $usuario -Description 'Usuario número 2'

}

crear "tarea" "Hola#1234"

function borrar($usuario) {
    Remove-LocalUser $usuario
}

borrar "tarea"


function leer($fichero) {                                                                    
    # Añadir el fichero a una variable                                                                
    $contenido = Get-Content $fichero
                                                              
    # Leer cada línea del fichero y crear otro fichero con el número línea y el contenido             
    for ($i=0 ; $i -lt $contenido.Length ; $i++){
        [String]$i+" "+$contenido[$i]
        New-LocalUser $contenido[$i] -Password(ConvertTo-SecureString "Hola#1234" -AsPlainText -Force) -FullName $contenido[$i] 
      }
}

leer "D:\Clase\Sistemas\PowerShell\Usuarios y grupos\ejAvanzado.txt"