# tugboat
Docker utility container for Graylog server and plugin development

This container provides `graylog-project`, `javac` and `mvn` utilities needed for Graylog 6.1 development, packaged on an Ubuntu base. This container
is not designed to run as a daemon -- instead it executes a single command (using the current working directory) and then stops and removes itself.

[![CodeFactor](https://www.codefactor.io/repository/github/robfromboulder/tugboat/badge)](https://www.codefactor.io/repository/github/robfromboulder/tugboat)
[![Contributing](https://img.shields.io/badge/contributions-welcome-green.svg)](https://github.com/robfromboulder/tugboat/blob/v6.1.x/CONTRIBUTING.md)


## System Requirements

* Docker Desktop for Windows (Intel 64-bit CPU, WSL 2 recommended)
* Docker Desktop for Mac (Apple Silicon or Intel)
* Docker for Linux (ARM 64-bit CPU or Intel 64-bit CPU)


## Installation

Define a bash alias:
```bash
alias tugboat='docker run -v $(pwd):/root/work -v $HOME/.m2:/root/.m2 --rm -it robfromboulder/tugboat:6.1.0a'
```
👆 This maps the current working directory into the container, while using your Maven cache to minimize downloads.

⚠️ When using Docker Desktop on Mac, it's necessary to add virtual file shares (in Settings|Resources|File sharing), or tugboat will fail to run properly.


## Using Utility Programs

Use Graylog CLI:
```bash
tugboat graylog-project version
```

Use maven:
```bash
tugboat mvn --version
```
