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
$RCONlocation = "C:\path\to\bercon.exe"
$RCONIP = "127.0.0.1"
$RCONPort = 1234
$RCONPassword = "mypassword"
$RCONSayPrefix = "My Server Name - "

$serverExeName = "my-arma2-server-name-without-the-exe"
$serverBecExeName = "my-arma2-bec-instance-name-without-the-exe"

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

function ZST_KillServer
{
	## Check if the server is already running, and if so, kick its ass off.
	if(Get-Process -name $serverExeName -ErrorAction SilentlyContinue)
	{	
		write-host "Found process with processname $serverExeName"
		Get-Process -name $serverBecExeName | Stop-Process -passThru
		Get-Process -name $serverExeName | Stop-Process -passThru
		
		write-host "Killed process with processname $serverExeName"
	}
}

function ZST_SendRCONCommand
{
	param([string]$command)
	##$parameters = "-ip $RCONIP -port $serverPort -rcon $RCONPassword -cmd `"$command`""
	$addcommand ="`"$command`""
	$parameters = " -ip $RCONIP -port $RCONPort -rcon $RCONPassword -cmd $addcommand"
	ZST_CreateProcess $RCONlocation $parameters
}

function ZST_SendKickCommand
{
	param([string]$id,[string]$reason)
	$outputMessage = "kick $id $reason"
	ZST_SendRCONCommand $outputMessage
}

function ZST_SendKickCommandAll
{
	for($i=0; $i -le 50; $i++)
	{
		ZST_SendKickCommand $id "Server is restarting. Please rejoin in a few moments when the server has restarted."
	}
}


function ZST_SendRCONMessage
{
	param([string]$message)
	$outputMessage = "say -1 " + $RCONSayPrefix + $message
	ZST_SendRCONCommand $outputMessage
}

function ZST_KillServerProcess
{
	ZST_SendRCONMessage "Attention - In order to maintain performance and re-spawn loot, the server restarts every 2 hours."
	ZST_SendRCONMessage "Attention - The next restart will occur in 10 minutes."
	Start-Sleep -s 300
	ZST_SendRCONMessage "Restarting server in 5 minutes! Please get ready to log off immediately!"
	Start-Sleep -s 60
	ZST_SendRCONMessage "Restarting server in 4 minutes! Please get ready to log off immediately!"
	Start-Sleep -s 60
	ZST_SendRCONMessage "Restarting server in 3 minutes! Please get ready to log off immediately!"
	Start-Sleep -s 60
	ZST_SendRCONMessage "Restarting server in 2 minutes! Please log off immediately!"
	Start-Sleep -s 60
	ZST_SendRCONMessage "Restarting server in 1 minute! Log off, or you will be kicked off to prevent data loss!"
	Start-Sleep -s 60
	ZST_SendRCONMessage "Server is restarting now! We can't be responsible for any data lost. See yo"
	#ZST_SendKickCommandAll -- Spams RCON, but better user experience.
	ZST_KillServer
}

ZST_KillServerProcess
