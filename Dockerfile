FROM jenkins/jenkins:lts
USER root

# Installing Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs npm

# Install Yarn
RUN npm install -g yarn

# Switch back to the non-root user
USER jenkins
