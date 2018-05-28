Generating a wildcard SSL certificate
=====================================

1. Issue DNS-01 challenge

       mkdir C:\dev\certbot\etc\letsencrypt
       mkdir C:\dev\certbot\var\lib\letsencrypt
       docker run -it --rm --name certbot `
         -v C:\dev\certbot\etc\letsencrypt:/etc/letsencrypt `
         -v C:\dev\certbot\var\lib\letsencrypt:/var/lib/letsencrypt `
         certbot/certbot -d *.mytritium.com --manual `
         --preferred-challenges dns `
         --server https://acme-v02.api.letsencrypt.org/directory `
         certonly
