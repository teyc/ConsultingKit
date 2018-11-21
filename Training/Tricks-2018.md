# Powershell

1. `$$` - _the last token in the previous command_

       git pull
       CONFLICT (content): Merge conflict in BFLoggingDemo.Api\BFLoggingDemo.Api.csproj
       CONFLICT (content): Merge conflict in BFLoggingDemo.Api\Controllers\SampleController.cs
       CONFLICT (content): Merge conflict in BFLoggingDemo.Api\Resources\Labels.resx
       vim BFLoggingDemo.Api\BFLoggingDemo.Api.csproj
       
         <ItemGroup>
            <Compile Include="Controller\Dtos\DatabaseCallResponse.cs" />
            <Compile Include="Controller\Dtos\SetLogLevelRequest.cs" />
            <Compile Include="Controller\Dtos\WillSucceedResponse.cs" />
            <Compile Include="Controller\LogController.cs" />
            <Compile Include="Controller\SampleController.cs" />
        <<<<<<< HEAD
            <Compile Include="Controller\CustomerController.cs" />
        =======
            <Compile Include="Controller\AddressController.cs" />
        >>>>>>> origin/master
            <Compile Include="Controller\Dtos\WillFailResponse.cs" />
            <Compile Include="Global.asax.cs">

       git add BFLoggingDemo.Api\BFLoggingDemo.Api.csproj
       git commit -m "merged"

2. `Get-PSDrive`

        PS C:\ctey\temp\a> get-psdrive

        Name           Used (GB)     Free (GB) Provider      Root
        ----           ---------     --------- --------      ----
        Alias                                  Alias
        C                 162.36         76.12 FileSystem    C:\
        Cert                                   Certificate   \
        D                                      FileSystem    D:\
        Env                                    Environment
        Function                               Function
        H                -332.44        333.44 FileSystem    \\aubriprfil06\homefolders$\ctey
        HKCU                                   Registry      HKEY_CURRENT_USER
        HKLM                                   Registry      HKEY_LOCAL_MACHINE
        P                 144.97         25.02 FileSystem    \\maau.group\Corporate\Applications
        R                2974.40        425.47 FileSystem    \\maau.group\corporate\roles
        Variable                               Variable
        WSMan                                  WSMan
        X                2974.40        425.47 FileSystem    \\maau.group\Corporate\Common

3. `(gci).Name` short hand for `gci | % { $_.Name }`


# C#

1. NSwag

       nswag.cmd webapi2swagger /assembly:.\Bin\BFLoggingDemo.Api.dll /output:BFLoggingDemo.Api.json
       
       nswag.cmd swagger2tsclient /input:BFLoggingDemo.Api.json /output:BFLoggingDemo.Api.ts
       
       nswag.cmd swagger2csclient /input:BFLoggingDemo.Api.json /output:BFLoggingDemo.Api.Client.cs /namespace:BFLoggingDemo.Api.Client

2. Windows workflow playing guess

3. Hangfire

# Roadside tricks and tips

1. $(".xyz").show()

# Docker

1. You can run more than 1 process in a single container.

       docker exec -it c08d92 /bin/bash

2. curl from docker

3. docker MSSQL Server

