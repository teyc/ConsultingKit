function Invoke-MSBuild
{
    [CmdletBinding()]
    param ( 
    
        [string][Parameter(Mandatory)] $solutionFile 
        
     )

    $dotNetVersion = "14.0"
    $regKey = "HKLM:\software\Microsoft\MSBuild\ToolsVersions\$dotNetVersion"
    $regProperty = "MSBuildToolsPath"

    $msbuildExe = join-path -path (Get-ItemProperty $regKey).$regProperty -childpath "msbuild.exe"

    &$msbuildExe $solutionFile /verbosity:minimal /p:Configuration=Release

    If ($LastExitCode -ne 0) 
    {
        Write-Error "Unable to build $solutionFile"
    }

}

Invoke-MSBuild -solutionFile Rmm.sln -ErrorAction Stop

.\OneEp.Rmm.DatabaseMigrations\bin\Release\OneEp.Rmm.DatabaseMigrations.exe --reset-the-world --testdata

Write-Host @'
   ____     __  __    __  __   
U |  _"\ uU|' \/ '|uU|' \/ '|u 
 \| |_) |/\| |\/| |/\| |\/| |/ 
  |  _ <   | |  | |  | |  | |  
  |_| \_\  |_|  |_|  |_|  |_|  
  //   \\_<<,-,,-.  <<,-,,-.   
 (__)  (__)(./  \.)  (./  \.)  
'@ -ForeGroundColor Magenta