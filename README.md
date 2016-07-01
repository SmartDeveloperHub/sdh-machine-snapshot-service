# sdh-machine-snapshot-service

Docker deployment of Widget Snapshot Service .

This repository deploys these containers:
* Widget Snapshot Service

### Ports (container - host):
* Widget Snapshot Service: 8888 - 8888

### Docker - Requirements:

* docker > 1.7.0
* docker-compose > 1.3.1

### Docker - Usage:

|Alias|Command|
|:---------|:----------|
|Start|```docker-compose up -d```|
|Stop|```docker-compose stop```|
|Delete|```docker-compose rm -f```|
|Rebuild|```docker-compose build```|

### Docker - Tips:

If you want to change port redirection or configuration, we suggest you:

1. Stop
2. Delete
3. Build (if you have changed any file or physical configuration)
4. Start

### Docker - Environment:

* Widget Snapshot Service Configuration

|Variable|Description|Example|
|:---------|:----------|:----------|
|PHANTOM_WORKERS|Number of phantom processes|1 or more|
|PHANTOM_EXECUTORS_PER_WORKER|Number of executors per process|1 or more|
|SDH_API_URL\*|URI where to locate the API|http://... |

\* This is obtained by default from the host environment
