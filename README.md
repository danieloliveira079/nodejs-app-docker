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
