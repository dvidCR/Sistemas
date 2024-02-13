:inicio
@echo off

title VirtualScript
mode 120

echo #######################################################################################################################
echo                                                         Acceso Rapido
echo #######################################################################################################################
echo.
echo.
echo                                             1. Ver maquinas virtuales.
echo                                             2. Crear una maquina virtual.
echo                                             3. Reasignar RAM de una maquina.
echo                                             4. Reasignar CPU de una maquina virtual.
echo                                             5. Manejar discos duros de una maquina virtual.
echo                                             6. Manejar adaptadores de red de una maquina virtual.
echo                                             7. Borrar una maquina virtual.
echo                                             8. Salir.
echo.
echo.
echo #######################################################################################################################

set /p op=Escoge una opcion:

if %op% == 1 ( goto ver )
if %op% == 2 ( goto crear )
if %op% == 3 ( goto ram )
if %op% == 4 ( goto cpu )
if %op% == 5 ( goto discos )
if %op% == 6 ( goto red )
if %op% == 7 ( goto borrar )
if %op% == 8 ( goto salir )

:ver

set /p ver=Escribe el nombre exacto de la mquina que quieras ver:

@echo off

VBoxManage showvminfo %ver%

pause

goto inicio

:crear

set /p nombre=Escribe un nombre para la maquina virtual:

echo.

set /p iso=Escribe el nombre exacto que tenga la iso:

VBoxManage createvm --name %nombre% --ostype %iso% --register

goto inicio

:ram

set /p maquina=¿A que maquina le quieres reasignar la RAM?:

set /p ram=¿Cuantos Megas le quieres poner ahora?(solo los numero):

VBoxManage modifyvm %maquina% --memory %ram%

goto inicio

:cpu

set /p nombre=Pon el nombre de la maquina:

set /p cpu=¿Cuantas CPUs quieres?:

VBoxManage modifyvm %nombre% --cpus %cpu%

got inicio

:discos

@echo off

echo                                             1. Crear disco duro
echo                                             2. Crear cd-rom
echo                                             3. Añadir disco
echo                                             4. Añadir cd-rom
echo.

set /p disco=Escoge una opción

if %disco% == 1 (
	set /p hd=De cuanto tamaño los quieres:

	set /p nombre=Como quieres llamar al disco:

	set /p ruta=Escribe la ruta en la que quieres poner el disco:

	VBoxManage createhd --filename %ruta%/%nombre%.vdi --size %hd% --format VDI

	goto inicio

)

if %disco% == 2 (
	set /p maquina=Pon el nombre de la maquina:

	VBoxManage storagectl %maquina% --name "IDE Controller" --add ide --controller PIIX4

	goto inicio

)

if %disco% == 3 (
	set /p maquina=Pon el nombre de la maquina:

	set /p ruta=Escribe la ruta en la que se encuentra el disco:

	set /p hd=Escribe el nombre del disco:

	VBoxManage storageattach %maquina% --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium %ruta%/%hd%.vdi

	goto inicio

)

goto inicio

:red

@echo off

echo                                             1. Añadir tarjeta de red
echo                                             2. Borrar tarjeta de red
echo                                             3. Modificar tarjeta de red
echo.

set /p tarjeta=Que quieres hacer:

if %tarjeta% == 1 (
	set /p nombre=Pon el nombre de la maquina:

	set /p tipo=De que tipo quieres la tarjeta:

	set /p numero=Que numero sera este adaptador:
	
	if %tipo% == bridged (
		set /p adaptador=Pon el nombre de tu tarjeta fisica:

		VBoxManage modifyvm %nombre% --nic%numero% %tipo% --nictype%numero% %adaptador%

		goto inicio

	) else (
		VBoxManage modifyvm %nombre% --nic%numero% %tipo%

		goto inicio

	)
	
)

if %tarjeta% == 2 (
	set /p nombre=Pon el nombre de la maquina:

	set /p numero=Pon el numero del adaptador de red que quieres borrar:

	VBoxManage modifyvm %nombre% --nic%numero% none

	goto inicio

)

if %tarjeta% == 3 (
	set /p nombre=Pon el nombre de la maquina:

	set /p tipo=De que tipo quieres la tarjeta:

	set /p numero=Pon el numero del adaptador de red que quieres modificar:

	if %tipo% == bridged (
		set /p adaptador=Pon el nombre de tu tarjeta fisica:

		VBoxManage modifyvm %nombre% --nic%numero% %tipo% --nictype%numero% %adaptador%

		goto inicio

	) else (
		VBoxManage modifyvm %nombre% --nic%numero% %tipo%

		goto inicio

	)

)

goto inicio

:borrar

set /p nombre=Pon el nombre de la maquina:

VBoxManage unregistervm %nombre% --delete

goto inicio

:salir

cls
