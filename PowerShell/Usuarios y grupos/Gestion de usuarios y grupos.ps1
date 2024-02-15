Get-Command -Module Microsoft.Powershell.LocalAccounts

Get-LocalUser

Get-LocalUser | Format-Table Name,Enabled

Get-LocalUser -Name Administrador

#Crear
#$password = Read-Host -AsSecureString
#New-LocalUser 'Usuario2' -Password $password -FullName 'Usuario 2 curso' -Description 'Usuario número 2'

#Borrar
#Remove-LocalUser Usuario1
#Get-LocalUser | Format-Table Name,Enabled

#Modificar
#Rename-LocalUser -Name 'Usuario2' -Newname 'lagomaruser'
#Set-LocalUser -Name 'lagomaruser' -Description 'Responsable TIC'
#Get-LocalUser -Name 'lagomaruser' | Set-Localuser -FullName  'Pepe'
#Set-LocalUser -Name 'lagomaruser' –PasswordNeverExpires $False

#Añadir a un grupo
#Get-Localuser -Name 'lagomaruser' | Add-LocalGroupMember -Group 'Usuarios'
#Enable-User -Name 'lagomaruser'

#Modificar contraseña
#$password = Read-Host -AsSecureString
#$usuario = Get-LocalUser -Name 'lagomaruser'
#$usuario | Set-LocalUser -Password $password