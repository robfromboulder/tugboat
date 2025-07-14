ARG VERSION
FROM ubuntu:jammy-20250619
ARG VERSION
ENV CONTAINER_VERSION=$VERSION

# Switch to Berkeley OCF mirror for updates, install helpful system utils
RUN sed -i 's|ports.ubuntu.com|mirrors.ocf.berkeley.edu|g' /etc/apt/sources.list && apt update && apt install --no-install-recommends -y ca-certificates curl gnupg less nano wget && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/ssl/private/ssl-cert-snakeoil.key && install -m 0755 -d /etc/apt/keyrings

# Add Adoptium repo for Temurin JDK
RUN curl -fsSL https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor -o /etc/apt/keyrings/adoptium.gpg && chmod a+r /etc/apt/keyrings/adoptium.gpg
RUN echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list

# Install JDK and development tools
RUN apt update && apt install --no-install-recommends -y git python3 ssh temurin-17-jdk wget && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Graylog CLI
RUN wget --progress=bar:force "https://github.com/Graylog2/graylog-project-cli/releases/download/0.50.0/graylog-project.linux" && chmod +x graylog-project.linux && mv graylog-project.linux /usr/bin/graylog-project

# Install Maven
RUN cd /opt && wget --progress=bar:force "https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.6/apache-maven-3.9.6-bin.tar.gz" -O - | tar -xzvf -
ENV PATH=/opt/apache-maven-3.9.6/bin:$PATH

# Create working directory
RUN mkdir /root/work
WORKDIR /root/work
