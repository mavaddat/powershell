set shell = CreateObject("WScript.Shell")
home = shell.ExpandEnvironmentStrings( "%HOME%" )
command = "powershell.exe -ExecutionPolicy ByPass -WindowStyle Hidden -Command ""& cd '" & home & "\dev\powershell'; .\Update-Backup -SetHomeParams"""
shell.Run command,0