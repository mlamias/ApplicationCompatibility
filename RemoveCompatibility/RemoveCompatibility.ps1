#AUTHOR:  	Mark J. Lamias
#Copyright:  	2018, Stochastic Group, Inc.
#Assumptions:	This program assumes execution on a Windows 7, Windows 8.1, or Windows 2010 workstation.  The Application you want to remove compatibility settings on must already installed.  Executing the program prior to installing the application will throw an error.
#Paramaters:	No input parameters are assummed to execut the program.  However, the program must reside inside the RemoveCompatibility directory shipped with this program.  You should however, change the program path constants WIN32PULSEPATH and WIN64PULSEPATH below along with the error messages.
#Execution:	    Excute by double clicking either the RunMe file bundled with this program or by running the PedazoDeBizcocho.bat file"
#Acknowledgements:  Code within the ApplicationCompatibility folder was developed on 3/26/2015 and published here: https://gallery.technet.microsoft.com/scriptcenter/How-to-set-the-compatibilit-f055ef26


#Set all program constants
#$SCRIPTPATH = "$MyInvocation.MyCommand.Path\ApplicationCompatibility"
$APPDIR = "$env:LOCALAPPDATA\MotVPNResultFile.txt"
$WIN32PULSEPATH = "C:\Program Files\Common Files\Pulse Secure\Component Manager\PulseCompMgr.exe"
$WIN64PULSEPATH = "C:\Program Files (x86)\Common Files\Pulse Secure\Component Manager\PulseCompMgr.exe"
$COMPUTERNAME = $env:COMPUTERNAME
$MAIN_EXECUTION_ERROR_MSG = "Error Occurred.  Please contact Mark Lamias for further assistance."
$MAIN_EXECUTION_SUCCESS_MSG = "Compatibility Configuration Updated Succesfully!"
$MISSING_PATH_ERROR_MSG = "No Program Path Exists!"

#Set System Shell for Alert Box
$WSHELL = New-Object -ComObject Wscript.Shell

#Import Required Subroutines
Import-Module $PSScriptRoot\ApplicationCompatibility

# This function Checks to determine if the pulse directory exists on the user's computer.  If not, an error is thrown.
function CheckPulsePath 
{
	param( [String]$Pulsepath)
	if (-not (Test-Path $Pulsepath)) 
	{ 
		$alertreturn=$WSHELL.Popup("$MISSING_PATH_ERROR_MSG",0,"Done",0x1) 
		$PathFound=0
	}
	else 
	{
		Remove-ApplicationCompatibility "$Pulsepath" -WarningAction SilentlyContinue -WarningVariable Message 
		$PathFound=1

	}
	return $PathFound
}


#Begin main execution of code
try {
	if ([System.IntPtr]::Size -eq 4) 
	{ 
		"Running 32-bit OS Update" 
		$ConfigResult = CheckPulsePath("$WIN32PULSEPATH")
	} else 
	{ 
		"Running 64-bit OS Update" 
		$ConfigResult = CheckPulsePath("$WIN64PULSEPATH")
	}		
     } 
catch {
	"$MAIN_EXECUTION_ERROR_MSG"
	$WSHELL.Popup("ERROR Occurred",0,"Done",0x1)
     }

$usersloggedin = query user /server:$COMPUTERNAME
$COMPUTERNAME,"$ConfigResult" -join ',' | Out-File -FilePath $APPDIR -Width 200 -Encoding ASCII;
"$usersloggedin" | Out-File -FilePath $APPDIR -Width 200 -Encoding ASCII -Append;


if ($ConfigResult -eq 1) 
{
	$WSHELL.Popup("$MAIN_EXECUTION_SUCCESS_MSG",0,"Done",0x1)
}
else 
{
	$WSHELL.Popup("$MAIN_EXECUTION_ERROR_MSG",0,"Done",0x1)
}