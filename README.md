# jenkins_rankrent

Steps to create Jenkins builds in container (Jenkins in)"
- Add package want to create in Dockerfile
	FROM jenkins/jenkins:lts

	USER root

	# Install Docker CLI
	RUN curl -fsSL https://get.docker.com -o get-docker.sh \
   		 && sh get-docker.sh

	# Install Node.js and npm
	RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
   		 && apt-get install -y nodejs npm

	# Install Yarn
	RUN npm install -g yarn

	# Switch back to the jenkins user
	USER jenkins

- Build the image: 
```
docker build -t jenkins-with-docker .
```

- Check specific package version in the image: 
```
docker run --rm -t jenkins-custom node --version
```

- Build jenkins: 
```
docker run -d \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 8082:8080 \
  -p 50001:50000 \
  jenkins-with-docker
```
