I made a Dockerfile to containerize the application. 

Used docker command ´´docker build -t node-hostname:local .´´ to create the image before building the container.
Used the docker command ´´docker run --rm -p 3000:3000 node-hostname:local´´ for test buidling from the image. 
After the server was responding "with a GET / 200", I removed the "--rm" and replaced it with "-d" since testing of the container wasn't 
needed no-more.   