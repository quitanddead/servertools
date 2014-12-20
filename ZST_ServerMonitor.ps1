<#
	  ______               _                 _ 
	 |___  /              | |               (_)
		/ / __ _ _ __ ___ | |__   ___  _ __  _ 
	   / / / _` | '_ ` _ \| '_ \ / _ \| '_ \| |
	  / /_| (_| | | | | | | |_) | (_) | | | | |
	 /_____\__,_|_| |_| |_|_.__/ \___/|_| |_|_|
				  _           _                
		 /\      | |         (_)               
		/  \   __| |_ __ ___  _ _ __           
	   / /\ \ / _` | '_ ` _ \| | '_ \          
	  / ____ \ (_| | | | | | | | | | |         
	 /_/    \_\__,_|_| |_| |_|_|_| |_|         
	  _______          _                       
	 |__   __|        | |                      
		| | ___   ___ | |___                   
		| |/ _ \ / _ \| / __|                  
		| | (_) | (_) | \__ \                  
		|_|\___/ \___/|_|___/                 
		
	A set of tools for simplifying ARMA/DAyZ server management.
	By Jordan Ashley Craw (ZamboniBambino)
	Licensed under GNU General Public License 2.0
#>

#### START OF NORMAL USER CONFIGURATION OPTIONS ####

## Create the variables storing the path. ##
$serverName = "MyServerNameWithoutSpaces"
$modType = "DayZOverpoch"
$serverExeName = "my-arma2-server-name-without-the-dot-exe"
$serverBasePathLocation = "C:\path\to\my\server\"
$serverPBOPathLocation = $serverBasePathLocation + "my\path\to\addons\dayz_server.pbo"
$serverBecExeName = "my-arma2-bec-server-name-without-the-dot-exe"

## MySQL Database information ##
$mySQLUsername = "my_dayz_database_name"
$mySQLPassword = "my_mysql_password"
$mySQLDatabase = "my_database_name"
$mySQLWorkBenchLocation = "C:\Program Files (x86)\MySQL\MySQL Workbench CE 6.1.4\mysqldump.exe"
$mySQLWorkBenchLocationCheck = "C:\Program Files\MySQL\MySQL Server 5.6\bin\mysqlcheck.exe"

## Compression information ##
$winRARLocation = "C:\Program Files\WinRAR\Rar.exe"
$winRARPassword = "ireallyshouldchangethis"

## Where the log files will be moved to when copied.. ##
$serverExternalStorageLocation = "C:\path\to\my\cloud\storage\"
$serverSettingsLocation = $serverExternalStorageLocation + "ZST_Settings.love"
$dayZInstanceName ="instance_11_Chernarus"

## Server Launch parameters
$serverPort = 6751
$serverconfigCfg = "config.cfg"
$serverbasicCfg ="basic.cfg"
$serverModString = "@DayzOverwatch;@DayZ_Epoch;@hive"

## BEC configuration ##
$serverBECLocation = "C:\path\to\my\bec\"
$serverBECLNKLocation = $serverBECLocation + $serverExeName + ".lnk"
$serverBECconfigLocation = "Config.cfg"

#### END OF NORMAL USER CONFIGURATION OPTIONS ####

## Default Logfile Names ##
$defaultInfiSTARAdminLog = "\AdminLog.txt"
$defaultInfiSTARHackLog = "\HackLog.txt"
$defaultInfiSTARSurveillanceLog = "\SurveillanceLog.txt"
$defaultInfiSTARSafeZoneLog = "\SafeZone.txt"
$defaultRPT = $dayZInstanceName + "\arma2oaserveroverpoch.RPT"
$defaultHiveExt = $dayZInstanceName + "\HiveExt.log"
$defaultServerLog = $dayZInstanceName + "\server_log.txt"
$defaultBattleEyeScripts = $dayZInstanceName + "\BattlEye\scripts.log"
$defaultBattleEyeBackpackCargo = $dayZInstanceName + "\BattlEye\addbackpackcargo.log"
$defaultBattleEyeAddMagazineCargo = $dayZInstanceName + "\BattlEye\addmagazinecargo.log"
$defaultBattleEyeWeaponCargo = $dayZInstanceName + "\BattlEye\addweaponcargo.log"
$defaultBattleEyeAttachTo = $dayZInstanceName + "\BattlEye\attachto.log"
$defaultBattleEyeCreateVehicle = $dayZInstanceName + "\BattlEye\createvehicle.log"
$defaultBattleEyeDeleteVehicle = $dayZInstanceName + "\BattlEye\deletevehicle.log"
$defaultBattleEyePublicVariable = $dayZInstanceName + "\BattlEye\publicvariable.log"
$defaultBattleEyeRemoteExec = $dayZInstanceName + "\BattlEye\remoteexec.log"
$defaultBattleEyeRemoteControl = $dayZInstanceName + "\BattlEye\remotecontrol.log"
$defaultBattleEyeSelectPlayer = $dayZInstanceName + "\BattlEye\selectplayer.log"
$defaultBattleEyeSetPos = $dayZInstanceName + "\BattlEye\setpos.log"
$defaultBattleEyeSetVariable = $dayZInstanceName + "\BattlEye\setvariable.log"
$defaultBattleEyeSetVariableVal = $dayZInstanceName + "\BattlEye\setvariableval.log"
$defaultBattleEyeTeamSwitch = $dayZInstanceName + "\BattlEye\teamswitch.log"
$defaultBattleEyeWaypointCondition = $dayZInstanceName + "\BattlEye\waypointcondition.log"
$defaultBattleEyeWaypointStatement = $dayZInstanceName + "\BattlEye\waypointstatement.log"

## List of files to loop through
$filesArray = @(
	$defaultInfiSTARAdminLog,
	$defaultInfiSTARHackLog,
	$defaultInfiSTARSurveillanceLog,
	$defaultInfiSTARSafeZoneLog,
	$defaultRPT,
	$defaultHiveExt,
	$defaultServerLog,
	$defaultBattleEyeScripts,
	$defaultBattleEyeBackpackCargo,
	$defaultBattleEyeAddMagazineCargo,
	$defaultBattleEyeWeaponCargo,
	$defaultBattleEyeAttachTo,
	$defaultBattleEyeCreateVehicle,
	$defaultBattleEyeDeleteVehicle,
	$defaultBattleEyePublicVariable,
	$defaultBattleEyeRemoteExec,
	$defaultBattleEyeRemoteControl,
	$defaultBattleEyeSelectPlayer,
	$defaultBattleEyeSetPos,
	$defaultBattleEyeSetVariable,
	$defaultBattleEyeSetVariableVal,
	$defaultBattleEyeTeamSwitch,
	$defaultBattleEyeWaypointCondition,
	$defaultBattleEyeWaypointStatement
)
$currentStage = 1
$startedDate = (Get-Date -format "-dd-MMM-yyyy-HH-mm")
$filesToMove = @()
$filesRenamed = @()
$currentSettings = @(0,0,0)

<#
	ZST_ShowStartupMessage
	
	Shows the startup message for Zamboni Server Tools
#>
function ZST_ShowStartupMessage
{
	write-host " ______                   _                    _ " -backgroundcolor white -foregroundcolor black
	write-host "|___  /                  | |                  (_)" -backgroundcolor white -foregroundcolor black
	write-host "   / /   __ _  _ __ ___  | |__    ___   _ __   _ " -backgroundcolor white -foregroundcolor black
	write-host "  / /   / _` || '_ ` _ \ | '_ \  / _ \ | '_ \ | |" -backgroundcolor white -foregroundcolor black
	write-host "./ /___| (_| || | | | | || |_) || (_) || | | || |" -backgroundcolor white -foregroundcolor black
	write-host "\_____/ \__,_||_| |_| |_||_.__/  \___/ |_| |_||_|" -backgroundcolor white -foregroundcolor black
	write-host " _____                                           " -backgroundcolor white -foregroundcolor black
	write-host "/  ___|                                          " -backgroundcolor white -foregroundcolor black
	write-host "\ `--.   ___  _ __ __   __ ___  _ __             " -backgroundcolor white -foregroundcolor black
	write-host " `--. \ / _ \| '__|\ \ / // _ \| '__|            " -backgroundcolor white -foregroundcolor black
	write-host "/\__/ /|  __/| |    \ V /|  __/| |               " -backgroundcolor white -foregroundcolor black
	write-host "\____/  \___||_|     \_/  \___||_|               " -backgroundcolor white -foregroundcolor black
	write-host " _____              _                            " -backgroundcolor white -foregroundcolor black
	write-host "|_   _|            | |                           " -backgroundcolor white -foregroundcolor black
	write-host "  | |  ___    ___  | | ___                       " -backgroundcolor white -foregroundcolor black
	write-host "  | | / _ \  / _ \ | |/ __|                      " -backgroundcolor white -foregroundcolor black
	write-host "  | || (_) || (_) || |\__ \                      " -backgroundcolor white -foregroundcolor black
	write-host "  \_/ \___/  \___/ |_||___/                      " -backgroundcolor white -foregroundcolor black
	write-host "                                "
	write-host " Some people look at things that are and ask 'why?'"
	write-host " I look at things that never were and ask 'why not?'"
	write-host ""
	write-host " Greetz to: ZFM Donators, BergStad.EU players, Epoch fans."
	write-host ""
	write-host " 'Know well what drives you forward; know better what holds you back.'"
	write-host ""
	write-host ""
}

function ZST_CheckSettingsInitialized
{
	If(!(Test-Path $serverSettingsLocation -pathType Leaf)) {
		write-host "Settings don't exist, creating..."
		New-Item -ItemType file -path $serverSettingsLocation | Out-Null
		write-host "Settings defaulted to 0. Will be overwritten when checks are conducted..."
	}
	else
	{
		write-host "Reading settings from settings file.."
		$currentSettings = Get-Content $serverSettingsLocation
		write-host "Read settings from settings file.."
	}
}

function ZST_CheckServerRunning
{
	## Check if the server is already running, and if so, kick its ass off.
	if(Get-Process -name $serverExeName -ErrorAction SilentlyContinue)
	{	
		write-host "Found process with processname $serverExeName"
		Get-Process -name $serverExeName | Stop-Process -passThru
		Get-Process -name $serverBecExeName | Stop-Process -passThru
		
		write-host "Killed process with processname $serverExeName"
	}
}

function ZST_CheckLogFiles
{
	$tempLoc = $serverExternalStorageLocation + $modType +"-"+$serverName +$startedDate + "/LogFiles/"

	## Construct the base path of the DayZ instance.
	foreach($file in $filesArray){
		$pathLoc = $serverBasePathLocation + $file
		If(Test-Path $pathLoc -pathType Leaf) {
			$size = (Get-Item $pathLoc).length
			write-host "Pass: "$file" `nFileSize: "$size" bytes`n" -foregroundcolor green
			
			If(!(Test-Path $tempLoc)) {
				New-Item -ItemType directory -Path $tempLoc
			}
			
			If(Test-Path $pathLoc -pathType Leaf) 
			{
				write-host "Moving log item $file .."
				Copy-Item $pathLoc $tempLoc
				write-host "Deleting log item $file .."
				Remove-Item $pathLoc
			}
		}
		else
		{
			write-host "Fail: "$file -foregroundcolor red
		}
	}
}

function ZST_CheckPBOFile
{
	if(!(Test-Path $serverPBOPathLocation -pathType Leaf))
	{
		write-host "No PBO Found! Please rebuild the PBO before restarting the server!" -foregroundcolor red
		Exit
	}
	else
	{	
		## Reference the library and pass the type of hash to it. I like Sha512!
		$algorithm = [Security.Cryptography.HashAlgorithm]::Create("SHA512")
		
		## Get the stream
		$fileBytes = [io.File]::ReadAllBytes($serverPBOPathLocation)
		$bytes = $algorithm.ComputeHash($fileBytes)
		$hash = -Join ($bytes | ForEach {"{0:x2}" -f $_})
		
		## Check to see if the array contains a hash
		if($currentSettings[0] -ne 0)
		{
			write-host "Confirmed that Settings contains hash for PBO.."
			if($currentSettings[0] -eq $hash) 
			{
				write-host "PBO hashes match the most recent hash on file. No changes to merge, skipping PBO backup." -foregroundcolor yellow
			}
			else
			{
				write-host "PBO hash on file is " $currentSettings[0] -foregroundcolor green
				write-host "PBO current hash is " $currentSettings[0] -foregroundcolor blue
				write-host "PBO has been modified since last run, beginning backup..." -foregroundcolor blue

				$tempLoc = $serverExternalStorageLocation + $modType +"-"+$serverName +$startedDate + "/PBO Files/"

				## Create the directory if it doesn't exist..
				If(!(Test-Path $tempLoc)) {
					New-Item -ItemType directory -Path $tempLoc
				}
				
				## Create a copy of the PBO and move it to the "PBO Files" directory
				write-host "Copying PBO over to backup folder..." -foregroundcolor blue
				Copy-Item $serverPBOPathLocation $tempLoc | Out-Null
				
				$renameLoc = $modType + "-" + $serverName + "-" + $startedDate + "-dayz_server.pbo" 
				
				if(!(Test-Path $renameLoc))
				{
					Rename-Item -path ($tempLoc+"dayz_server.pbo") -newname $renameLoc | Out-Null
				}
			
				## Write to file.. :)
				$currentSettings | out-file -filepath $serverSettingsLocation

			}
		}
		else
		{
			write-host "Settings doesn't contain hash. Will use hash generated previously and set.."
			$currentSettings[0] = $hash
			
				$tempLoc = $serverExternalStorageLocation + $modType +"-"+$serverName +$startedDate + "/PBO Files/"

				## Create the directory if it doesn't exist..
				If(!(Test-Path $tempLoc)) {
					New-Item -ItemType directory -Path $tempLoc | Out-Null
				}
				
				## Create a copy of the PBO and move it to the "PBO Files" directory
				write-host "Copying PBO over to backup folder..." -foregroundcolor blue
				Copy-Item $serverPBOPathLocation $tempLoc | Out-Null
				
				$renameLoc = $modType + "-" + $serverName + "-" + $startedDate + "-dayz_server.pbo" 
				Rename-Item -path ($tempLoc+"dayz_server.pbo") -newname $renameLoc | Out-Null
		
				## Write to file.. :)
				$currentSettings | out-file -filepath $serverSettingsLocation
		}
	}
}

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
	$processInstance.start() | Out-Null
	$processInstance.PriorityClass = "Realtime"
	
	## Return it.
	$processInstance
}

function ZST_CreateSQLDump
{
	write-host "Beginning dump of database: " $mySQLDatabase
	
	## Create the location that the database dump should be in..
	$tempLoc = $serverExternalStorageLocation + $modType +"-"+$serverName +$startedDate + "\Databases\"
	
	## Create the path if it doesn't exist 
	If(!(Test-Path $tempLoc)) {
		New-Item -ItemType directory -Path $tempLoc | Out-Null
	}
	## Creates the filename
	$fileName = $tempLoc + $modType +"-"+$serverName+"-"+$mySQLDatabase+"-"+$startedDate+".sql"
	cmd /c " `"$mySQLWorkBenchLocation`" --routines -h localhost -u $mySQLUsername -p$mySQLPassword $mySQLDatabase > $fileName" | Out-Null
	write-host "Dump of database " $mySQLDatabase "completed.."
	$process
}

function ZST_OptimiseSQL
{
	$tempLoc = $serverExternalStorageLocation + $modType +"-"+$serverName +$startedDate + "\Databases\"
	$fileName = $tempLoc + $modType +"-"+$serverName+"-"+$mySQLDatabase+"-CheckCompleted"
	cmd /c "`"$mySQLWorkBenchLocationCheck`" --user=$mySQLUsername --password=$mySQLPassword --optimize --auto-repair --extended $mySQLDatabase" | Out-Null
}

function ZST_CompressBackupFolder
{
	#Rar.exe a -r -ep1 Test.rar "C:\Users\Desktop\abc\"
	$folderLocation = $serverExternalStorageLocation + $modType + "-"+$serverName+$startedDate
	$fileName = $folderLocation + ".rar"
	cmd /c "`"$winRARLocation`" a -r -p$winRARPassword -ep1 $fileName $folderLocation " | Out-Null
	
	## Get rid of the backup folder.
	Remove-Item $folderLocation -recurse
	
}

function ZST_RunArmaServer 
{
	$fileName = "$serverBasePathLocation" + $serverExeName + ".exe"
	$arguments = "-port=$serverPort -config=$dayZInstanceName\$serverconfigCfg -cfg=$dayZInstanceName\$serverbasicCfg -name=$dayZInstanceName -profiles=$dayZInstanceName -mod=$serverModString -noSound -world=empty -maxMem=2047 -cpuCount=6 -exThreads=7 -noPause -noCB -malloc=tbb4malloc_bi"
	$process = ZST_CreateProcess $fileName $arguments
	$process
}

function ZST_RunArmaServer_BEC
{
	Stop-Process -name $serverBecExeName+"*" | Out-Null
	$process = Invoke-Item $serverBECLNKLocation
}

<#
	ZST_RunStartup
	
	Does the startup process for the configured server..
#>
function ZST_RunStartup
{	
	## For PBO check
	ZST_CheckSettingsInitialized
	
	## Kill existing servers
	ZST_CheckServerRunning
	
	## Copy and trim logfiles.
	ZST_CheckLogFiles
	
	## Copy PBO if it changes
	ZST_CheckPBOFile
	
	## Dump SQL
	ZST_CreateSQLDump
	
	## Optimise the SQL tables..
	ZST_OptimiseSQL
	
	## Create a passworded RAR file..
	ZST_CompressBackupFolder
	
	## Run the server..
	ZST_RunArmaServer
	
	## Run BEC
	ZST_RunArmaServer_BEC
}

function ZST_RunMonitor
{
	##Self-aggrandizement
	ZST_ShowStartupMessage
	
	## Run startup
	ZST_RunStartup | Out-Null
	
	$continueRunning = $True
	
	while($continueRunning) 
	{
		$serverProcess = Get-Process $serverExeName -ErrorVariable S -ErrorAction SilentlyContinue | Out-Null
		$serverBECProcess = Get-Process $serverBecExeName -ErrorVariable B -ErrorAction SilentlyContinue  | Out-Null
		
		## Check if it's closed. I like this hack.
		$serverRunning = [bool]$S.length
		$BECRunning = [bool]$B.length
	
		if($serverRunning -eq $True) 
		{
			write-host "ARMA 2 Server isn't responding. Well, let's sort this out, shall we?"
			Stop-Process -name $serverExeName
			write-host "Killed ARMA 2 Server process, BEC will close automatically. There may have been data loss in the final seconds."
			write-host "Begin restart process.."
			ZST_RunStartup | Out-Null
			write-host "Restarted ARMA server process. Sitting, waiting for the next restart or crash."
		}
		if($BECRunning -eq $True)
		{
			write-host "BEC closed. Re-opening BEC."
			Stop-Process -name $serverBecExeName+"*" | Out-Null
			ZST_RunArmaServer_BEC	
		}	
	}
	
}

ZST_RunMonitor
