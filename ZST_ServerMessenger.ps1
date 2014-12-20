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

## RCon User information ##
$RCONlocation = "C:\my\path\to\bercon.exe"
$RCONIP = "127.0.0.1"
$RCONPort = 6751
$RCONPassword = "myrconpassword"
$RCONSayPrefix = "My server name "
$RCONSaySuffix = " My website @ test.xyz"
$messageFile = "ZST_ServerMessages.love"
$messages = @{}

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

function ZST_SendRCONCommand
{
	param([string]$command)
	##$parameters = "-ip $RCONIP -port $serverPort -rcon $RCONPassword -cmd `"$command`""
	$addcommand ="`"$command`""
	$parameters = " -ip $RCONIP -port $RCONPort -rcon $RCONPassword -cmd $addcommand"
	ZST_CreateProcess $RCONlocation $parameters
}

function ZST_SendRCONMessage
{
	param([string]$message)
	$outputMessage = "say -1 " + $RCONSayPrefix + $message + $RCONSaySuffix
	ZST_SendRCONCommand $outputMessage
}

function ZST_SendMessageToServer 
{
	$randomMessage = Get-Content $messageFile | Get-Random -Count 1
	ZST_SendRCONMessage $randomMessage
}

ZST_SendMessageToServer
