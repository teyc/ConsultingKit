# Docker on Windows

This exercise attempts to answer several questions

  - Can we dockerize existing legacy .NET 4.5 
    applications so that they run in Windows docker with 
    IIS?

  - How do we configure networking? Database connections?

  - What is the development experience like? Can we use
    `docker-compose`?

  - What is the debugging and troubleshooting experience like?


## Exercise 0, process isolation mode

  Depending on your Windows version you may either need either 1809 or 1903 version of the docker image

  The following creates a container and runs PING on it.

      docker run --rm --isolation=process mcr.microsoft.com/windows/nanoserver:1809 cmd.exe /c ping 127.0.0.1 -t

      docker run --rm --isolation=process mcr.microsoft.com/windows/nanoserver:1903 cmd.exe /c ping 127.0.0.1 -t

  Also note that the container behaves like a unique computer. The following shows how the hostname is 
  different each time you run it

      docker run --rm --isolation=process mcr.microsoft.com/windows/nanoserver:1903 cmd.exe /c hostname
  

## Exercise 1, setting up a web application

      # builds an 'image' called 'hello-web' that we can spin up
      docker build --tag hello-web --file .\Dockerfile-web .

      # list the images that are cached on the local computer
      docker image ls

      # spins up the 'hello-web' image in a 'container'
      docker run --publish 18080:80 --detach --rm --isolation process --name web.my.local hello-web

      # lists running containers
      docker ps

      start http://localhost:18080/

## Exercise 2, set up a webapi endpoint

      docker build --tag hello-api --file .\Dockerfile-webapi .

      docker run --publish 18081:80 --detach --rm --isolation process --name api.my.local hello-api

  Observe that these two processes have their own IIS instances, but at the same time are just processes.

    get-process servicemonitor 

## Exercise 3, set up SQL Server

  docker run -d -p 1433:1433 -v $PWD/sqlserver:C:\SqlServerTemp --name sqlserver.my.local microsoft/mssql-server-windows-express

Then run a shell, and create the tables, and copy the database to a local directory

    docker exec -it -v $PWD/sqlserver:C:/Temp sqlserver.my.local powershell.exe
    C:\> sqlcmd -i C:\SqlServerTemp\001_policies_table.sql
    C:\> copy C:\program files\mssqlserver\mssql.express\sqlserver\data\travel.mdf C:\temp
    C:\> copy C:\program files\mssqlserver\mssql.express\sqlserver\data\travel_log.ldf C:\temp

This builds a brand new SQL Server image that has a database inside

    docker build -t hello-sql --file .\Dockerfile-sqlserver .

Next we can run the database

    docker run -it --detach --name sqlserver.my.local hello-sql 

## Exercise 4, set up an entire set of applications

  docker stop web.my.local api.my.local
  
  docker-compose up

## Exercise 4, edit the website in development mode

  Development using docker build can be time consuming, since we will have to build a brand
  new image each time. We can share a local directory with a running container so that we
  can keep updating the project until it works.

  First we should stop our existing container.

  List the running processes, find the name of the process we wish to stop
  
      docker ps

  Then kill the process

      docker stop web.my.local

  Next start up the container this way

      docker run -v C:\dev\oss\consultingkit\training\docker-windows\webapp:C:\inetpub\wwwroot --publish 18080:80 --detach --rm --isolation process --name web.my.local hello-web


# References

[1] https://poweruser.blog/lightweight-windows-containers-using-docker-process-isolation-in-windows-10-62519be76c8c