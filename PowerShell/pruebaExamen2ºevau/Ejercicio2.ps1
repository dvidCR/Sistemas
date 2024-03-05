New-Item -Path './NuevaCarpeta' -ItemType Directory

New-Item -Path './NuevaCarpeta/SourceFolder' -ItemType Directory

New-Item -Path './NuevaCarpeta/DestinationFolder' -ItemType Directory

New-Item -Path './NuevaCarpeta/ExampleFolder' -ItemType Directory

New-Item -Path './NuevaCarpeta/SourceFolder/ejemplo.txt' -ItemType File

Copy-Item -Path './NuevaCarpeta/SourceFolder/ejemplo.txt' -Destination './NuevaCarpeta/DestinationFolder'

Copy-Item -Path './NuevaCarpeta/SourceFolder/ejemplo.txt' -Destination './NuevaCarpeta/ExampleFolder'

Remove-Item -Path './NuevaCarpeta/ExampleFolder/ejemplo.txt'

New-Item -Path './NuevaCarpeta/ExampleFolder/viejoNombre.txt' -ItemType File

Rename-Item -Path './NuevaCarpeta/ExampleFolder/viejoNombre.txt' -NewName "nuevoNombre.txt"