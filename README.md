# ApplicationCompatibility
These powershell scripts can be used to remove the "Run this program in compatibility mode for" setting on Windows OS installed programs. 

The following parameters may be set in the main powershell script (RemoveCompatibility.ps1) in the root folder:

1.  APPDIR:  This sets the path and filename to the location where you'd like the log file to be written.
2.  WIN32PULSEPATH:  This is the path, on windows 32-bit operating systems, to the program executable whose compatibility settings you want to remove.
3.  WIN64PULSEPATH:  This is the path, on windows 64-bit operating systems, to the program executable whose compatibility settings you want to remove.
4.  COMPUTERNAME: This is the computer name of the machine that runs the program.
5.  MAIN_EXECUTION_ERROR_MSG:  This is the main execution error message that is called if the program fails.
6.  MAIN_EXECUTION_SUCCESS_MSG:  This is the main execution success message that is called if the program sucesfully runs.
7.  MISSING_PATH_ERROR_MSG:  This is the message that is displayed if the program path (2, and 3) cannot be found.

#AUTHOR:  	Mark J. Lamias
#Copyright:  	2018, Stochastic Group, Inc.
#Assumptions:	This program assumes execution on a Windows 7, Windows 8.1, or Windows 2010 workstation.  The Application you want to remove compatibility settings on must already installed.  Executing the program prior to installing the application will throw an error.
#Paramaters:	No input parameters are assummed to execut the program.  However, the program must reside inside the RemoveCompatibility directory shipped with this program.  You should however, change the program path constants WIN32PULSEPATH and WIN64PULSEPATH below along with the error messages.
#Execution:	    Excute by double clicking either the RunMe file bundled with this program or by running the PedazoDeBizcocho.bat file"
#Acknowledgements:  Code within the ApplicationCompatibility folder was developed on 3/26/2015 and published here: https://gallery.technet.microsoft.com/scriptcenter/How-to-set-the-compatibilit-f055ef26

