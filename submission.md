1. What is the difference between Docker image and Docker container?
    *   A Docker image is the base environment for the container to run off of. The Docker Image contains source code and tools needed for the application to run. The container on the other hand is the run time environment, which is a isolated user space of processes. The container is dependent on the Image. 

2. What is the command to build a docker image named `cit384-final`?
    *   docker build -t cit384-final

3. What is the command to run a container with `cit384-final` image with an interactive terminal running bash?
    *   docker run -it -p 8080:80 cit384-final /bin/bash

4. When running Docker commands there are many options you can use for example to run a container named cit384 with an ubuntu image the command is: `docker run --name cit384 ubuntu`. What do the following options do? 
   1. --name: Names my container cit384
   2. -d: Detached mode is a single use command which will terminate the container if the process were to exit.
   3. --rm:  Removes docker container after use. Good to pair with -d.
   4. -p:   Shows containers ports.
   5. --add-host:  Add host is a single use command to attach a external host to your container. Command can be used multiple times in run command. (host:ip)
   6. -it:  Creates an interactive Bash shell in container.
   7. -v:   Mounts current directory into container.

5. What is the difference between `-` and `--` in command line parameter?
    *    single dash is a shortcut in which using the full options name would require "--"

6. In the following code block, provide the git instructions necessary to add a new file to the remote repository: git@github.com:org/project.git (You should presume that you don't have a copy of this repository on your local computer.)
   ```
       git clone git@github.com:org/project.git
       git add .
       git commit -m "message"
       git push
   ```
   <!-- You many add any number of lines in the above code block that you need. -->

7. What do the following Apache Directive do?
   1. SSLEngine: Allows us to enable or disable the SSL engine for 
   2. ProxyEngine: Enables ssl engine for proxy use.
   3. ProxyAddHeaders:  Gateway for proxy information to be passed through.
   4. ProxyPass: Allows servers to be mapped locally.
   5. ProxyPassReverse: Remaps URL to reflect httpd responses.
   6. RewriteRule: Allows server to manipulate requested URL.
   7. Redirect: Forces http redirect to a new URL.

8. What module needs to be enabled in order to use the Rewrite directive?
    * mod_rewrite RewriteEngine On
9. What is the command to enable a new domain/vHost?
    * <VirtualHost *:80>

10. What is the command to disable a new domain/vHost?
    *   a2dissite

11. What happens when a user enters a URL into the browser?
    * Browser will look up the ip and send a http request to the server.

---
You may earn extra credit in this part of the assignment by: 
   1. Adding a file named ``interview_question.md`` to your repository
   2. Providing a comprehensive answer, in essay form, to the following question:
      * What happens when a user enters a URL into the browser?

Of course, your answer here need to much more complete and robust then the answer you provide to the last question in the assignment above.
