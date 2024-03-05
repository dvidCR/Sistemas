Set-ExecutionPolicy Unrestricted
$continuar = $true
while ($continuar) {
    Clear-host

    Write-Host "1. Listar usuarios"
    Write-Host "2. Crear usuarios (pide usuario y contraseña)"
    Write-Host "3. Cambiar descripción de usuario"
    Write-Host "4. Desactivar usuario"
    Write-Host "5. Borrar Usuario"
    Write-Host "6. Salir"

    $x=Read-Host "Seleccione opción"

    switch ($x) {
        1 {
            Get-LocalUser

            Start-Sleep -Seconds 1.5
        }

        2 {
            $usuario = Read-Host "Escribe el nombre del usuario"
            $contraseña = Read-Host "Escribe la contraseña(ponla vacia si quieres un usuario sin contraseña)"
            if ($contraseña -eq "") {
                New-LocalUser $usuario -NoPassword -FullName $usuario
            } else {
                New-LocalUser $usuario -Password(ConvertTo-SecureString $usuario -AsPlainText -Force) -FullName $usuario
            }
        }

        3 {
            $usuario = Read-Host "Escribe el nombre del usuario"
            $des = Read-Host "Escribe la nueva descripcion"
            Set-LocalUser -Name $usuario -Description $des
        }

        4 {
            $usuario = Read-Host "Escribe el nombre del usuario"
            Disable-LocalUser -Name $usuario
        }

        5 {
            $usuario = Read-Host "Escribe el nombre del usuario"
            Remove-LocalUser $usuario
        }

        6 {
            $continuar = $false
        }
    }
}