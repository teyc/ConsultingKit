function Invoke-MSBuild
{
    [CmdletBinding()]
    param ( 
    
        [string][Parameter(Mandatory)] $solutionFile 
        
     )

    $dotNetVersion = "15.0"

    If ($dotNetVersion -eq "15.0")
    {
        $msBuildDirectory = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\$dotNetVersion\bin"
    }
    Else
    {
        $regKey = "HKLM:\software\Microsoft\MSBuild\ToolsVersions\$dotNetVersion"
        $regProperty = "MSBuildToolsPath"
        $msBuildDirectory = (Get-ItemProperty $regKey).$regProperty
    }
    $msbuildExe = join-path -path $msBuildDirectory -childpath "msbuild.exe"

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
