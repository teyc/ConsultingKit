# Outline

# What is Docker

- like a virtual machine
  
  - separate disk
  
  - separate network
  
  - download images and execute
  
- *unlike* a virtual machine

  - no memory quota
  
  - no CPU quota
  
  - no disk quota
  
  - no persistence (by default)
  
- like a process jail

  - runs under the host os
  
  - limited privilege
  
  - reads and writes can be redirected to other directories
  
# What you can do with docker

  - run apps
  
  - run python scripts with isolated dependencies
  
  - run databases
  
  - run webservices
  
  - run build agents

# Security
 
  - depends on container implementation
  
  - good security so far
  
  - docker containers can starve other containers of memory
  
# Workshop

  - demonstrate running mediawiki
  
    `docker run -e VIRTUAL_HOST=wiki.seotomata.com mediawiki`
    
  - run a python program
  
    ```
    docker run -it python:2 bash
    pip install beautifulsoup
    python
    
    import urllib2
    from BeautifulSoup import BeautifulSoup

    page = urllib2.urlopen('http://yahoo.com').read()
    soup = BeautifulSoup(page)
    soup.prettify()
    for anchor in soup.findAll('a', href=True):
       print anchor['href']
    ```


  

