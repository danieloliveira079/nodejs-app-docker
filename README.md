# Nodejs Application Container
Tiny container to demonstrate the usage of Salt Stack as a container orchestrator and scheduler. 

https://github.com/danieloliveira079/saltstack-container-scheduler

On every service booting a random Star Wars characther's is defined and it will last during the whole container's life.

This name is sent to clients that triggers a `GET` request to the endpoint `http://localhost:7001`.

The [Salt Stack project](https://github.com/danieloliveira079/saltstack-container-scheduler) demonstrates how a Docker Swarm Cluster can be managed by using Salt Stack. That means multiples containers running behind of a load balancing service.

The purpose of that response is to demonstrates which container has had handled the request that has been routed through the load balancer. 

However if you just wanna run the container for your own purpose you can start it using the following command:

`$ docker run -it --rm --name nodejs-starwars -p 7001:7001 danieloliv/nodejs-app-docker`

After pulling the image from the [Docker Hub](https://hub.docker.com/r/danieloliv/nodejs-app-docker/) repository you will se a message like below:

```
> salt-stack-expressjs-container@1.0.0 start /usr/src/app
> node index.js
Server listening on port 7001!
```

From this point just point your browser to `http://localhost:7001` or use the `curl http://localhost:7001` commandline tool to trigger requests. The results will be something similar to:

```
$ curl http://localhost:7001
$ Hello, I am Chewbacca
```

In the container log you might see:

```
========> Container Name: Chewbacca
::ffff:172.17.0.1 - - [26/Jan/2017:08:23:04 +0000] "GET / HTTP/1.1" 200 21 "-" "curl/7.51.0"
```

# MIT License

Copyright (c) 2017 Daniel Oliveira

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

