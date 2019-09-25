# Installing Docker for Windows on Windows Server 2016

Using the administrative powershell

    Install-Module DockerMsftProvider -Force
    Install-Package Docker -ProviderName DockerMsftProvider -Force
    [Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://username:password@proxy:port/", [EnvironmentVariableTarget]::Machine)
    Restart-Service docker
    
Next test whether docker ran

     docker container run hello-world:nanoserver-sac2016
     
     
