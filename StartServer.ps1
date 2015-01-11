function ZST_CreateProcess
{
	param([string]$processFileNameLocation,[string]$processParameters)
	
	## Create the processinfo part.
	$processInfo = New-Object System.Diagnostics.ProcessStartInfo
	$processInfo.FileName = $processFileNameLocation
	$processInfo.Arguments = $processParameters
	$processInfo.UseShellExecute = $False
	$processInfo.RedirectStandardOutput = $True
	$processInfo.RedirectStandardError = $True
	
	# Create the process
	$processInstance = New-Object System.Diagnostics.Process
	$processInstance.StartInfo = $processInfo
	$processInstance.start()
	$processInstance.PriorityClass = "Realtime"
	
	## Return it.
	$processInstance
}

## Location of the server 
$serverDir = "CHANGE TO BASE FOLDER OF SERVER INSTANCE"

## Path to the arma2oaserver exe
$serverDirA2OAServer = $serverDir + "arma2oaserver.exe"

## The location of the addons directory..
$addonsDir = $serverDir + "@DayZ_Epoch_Server\addons\"
$addonsDirDZFolder = $addonsDir + "dayz_server"
$addonsDirBackups = $addonsDir + "backups\"

## The location of the dayz_server pbo
$pboLocation = $addonsDir + "dayz_server.pbo"

## The location of PBO Manager PBOConsole Exe
$pboBuildLocation = "C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe"
$pboSourceDirLocationName = "dayz_server"

## Params for Arma2oaserver
$params = "-port=2302 ""-config=instance_11_Chernarus\config.cfg"" ""-malloc=tbb4malloc_bi -noSound -world=empty -maxMem=2047 -cpuCount=4 -exThreads=1 -noPause -noCB -cfg=instance_11_Chernarus\basic.cfg"" ""-profiles=instance_11_Chernarus"" -name=instance_11_Chernarus ""-mod=@DayZ_Epoch;@DayZ_Epoch_Server;"""

## Check the PBO exists
If(Test-Path $pboLocation)
{
	## Get the current date
	$d = Get-Date

	## Item name	
	$itemName = "dayz_server" + $d.Day + $d.Month + $d.Year + "-" + $d.Hour + "-" + $d.Minute + "-" + $d.Second + ".pbo"

	## Check the Backups dir exists
	If(!(Test-Path $addonsDirBackups))
	{
		## Create the dir
		New-Item $addonsDirBackups -type directory
	}	
	
	## Rename the PBO
	Rename-Item $pboLocation $itemName
	
	## Get the full path of the renamed PBO
	$pboFullName = $addonsDir + $itemName
	
	## Get the full path of the moved to PBO location
	$pboMovedName = $addonsDirBackups + $itemName
	
	## Move the PBO to backups
	Move-Item -path $pboFullName -destination $pboMovedName
	
	$pboFullBuildPath = $addonsDir + "dayz_server.pbo"
	
	$pboArguments = @("-pack","""$addonsDirDZFolder""", """$pboFullBuildPath""")
	& $pboBuildLocation $pboArguments
	
	ZST_CreateProcess $serverDirA2OAServer $params
	
}
else
{
	$pboFullBuildPath = $addonsDir + "dayz_server.pbo"
	$pboArguments = @("-pack","""$addonsDirDZFolder""", """$pboFullBuildPath""")

	& $pboBuildLocation $pboArguments
	ZST_CreateProcess $serverDirA2OAServer $params
}