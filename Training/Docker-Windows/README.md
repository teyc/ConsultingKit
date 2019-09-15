# Docker on Windows

This exercise attempts to answer several questions

  - Can we dockerize existing legacy .NET 4.5 
    applications so that they run in Windows docker with 
    IIS?

  - How do we configure networking? Database connections?

  - What is the development experience like? Can we use
    `docker-compose`?

  - What is the debugging and troubleshooting experience like?

  
## Exercise 1, setting up a web application

      docker build --tag hello-web --file .\Dockerfile-web .

      docker run --publish 18080:80 --detach --rm --name web.my.local hello-web

      start http://localhost:18080/

## Exercise 2, set up a webapi endpoint

      docker build --tag hello-api --file .\Dockerfile-webapi

      docker run --publish 18081:80 --detach --rm --name api.my.local 


