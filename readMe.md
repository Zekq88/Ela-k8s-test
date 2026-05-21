I made a Dockerfile to containerize the application. 

Used docker command ``docker build -t node-hostname:local .`` to create the image before building the container.
Used the docker command ``docker run --rm -p 3000:3000 node-hostname:local`` for test buidling from the image. 
After the server was responding "with a GET / 200", I removed the "--rm" and replaced it with "-d" since testing of the container wasn't 
needed no-more.   

Since it should be a complete delivered solution, the k8s will not get images from GHCR. due to, ownership problems and disputes.

therefore the image is local.


#ToDO

* Complete the push to container registry docker hub. I didn't have a user on that site since i never had the need of it, due to the use  of ghcr.io.
after that you can update the ´´deployment.yaml´´-file and pull an image from the container registry.
* Add HTTPS ingress
* Add Helm chart



# Hi dear costumer at Kent AB

we have containerzied your backend and implemented kubernetes with 3 replicas/pods. this will solve your first issue since it will not improve the preformance during peak hours.

We recommend the uses of an SaaS-service that will fix your second issue with downtime, deployment to a managed cloud Kubernetes platform (AKS, EKS or GKE) is recommended for higher availability and infrastructure redundancy.

By containerization and Kubernetes deployment create a more standardized and reproducible deployment workflow, which solves your third issue. This reduces deployment inconsistencies and creates a foundation for future CI/CD automation.

follow the steps.

### step 1
clone the github repo: by using cmd ``git clone https://github.com/Zekq88/Ela-k8s-test.git``

### step 2
run the docker command ``docker build -t node-hostname:local .``
followed by ``docker run -d -p 3000:3000 node-hostname:local``

### step 3
enable kuernetes. Double check with command ``kubectl get nodes``.
run the commands ``kubectl apply -f k8s/deployment.yaml | kubectl apply -f k8s/service.yaml``
followed by ``kubectl get pods | kubectl get svc`` for verifycation.

### step 4

run ``kubectl port-forward svc/node-hostname-service 8070:80`` 

and open your browser ``http://localhost:8070``.
