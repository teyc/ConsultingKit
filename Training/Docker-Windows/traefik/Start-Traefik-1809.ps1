docker run -it -p 8080:8080 -p 80:80 `
  --rm `
  --name traefik `
  -v $PWD/.:C:\etc\traefik `
  traefik:v1.7.17-windowsservercore-1809 `
  --debug --docker.endpoint=npipe:////./pipe/docker_engine
  
