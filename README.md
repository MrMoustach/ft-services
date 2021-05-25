## Table of Contents

* [Background / Overview](#background--overview)
* [Features](#features)
* [Prerequisites](#prerequisites)
  * [Installation](#installation)
  * [Structure / Scaffolding](#structure--scaffolding)
* [How does it work](#How-does-it-work)

## Background / Overview

Ft-services is a 42-cursus project, meant to get an in-depth look at the kubernetes/docker eco-system, in it we are tasked with creating a cluster of 7 pods that communicate with each other.

## Prerequisites

You will need the following stuff.

* [Minikube](https://minikube.sigs.k8s.io/docs/start/)
* [VirtualBox](https://www.virtualbox.org/) or docker

### Installation

Open your terminal and type in

```sh
$ git clone https://github.com/mrmoustach/ft-services
$ cd ft-services
```

Run the deployement

Note that if you are using docker instead of VirtualBox you can change the driver in the setup.sh file

```sh
$ ./setup.sh
```

### Structure / Scaffolding

```text
srcs
├── images
│   ├── ftps
│   ├── grafana
│   ├── influxdb
│   ├── mysql
│   ├── nginx
│   ├── phpmyadmin
│   ├── wordpress
└── deployement
│   ├── ftps
│   ├── grafana
│   ├── influxdb
│   ├── mysql
│   ├── nginx
│   ├── phpmyadmin
│   ├── wordpress
│   ├── metallb
```

<strong>Note:</strong> To check the running pods run :

```sh

$ kubectl get pods
```

## How does it work

Well, you know how services tend to fail or malfunction, if you have all your services in one container/pod it will be a waste of time to restart the whole container in order to fix a single service, so in the project we are putting every one of them in it's own pod, and creating a connection between them, every pod must be persistent, meaning it must restart if it fails, and keeps the state it was on before failing, so for example, the databases we have here (mysql and influxDB) we use persistent storage in order to keep the data safe outside the pod instead of inside it etc..

to achieve this we start by creating a docker image for every pod, the image starts an empty alpine linux container, why alpine specificly? you ask, well it a light weight linux disto that allows us a great deal of versatility and portabilty, and it's perfect for these kind of situations, and also it was in the subject, then the steps vary for every pod, for example in mysql case, we install the mysql-server, we create a user then a database and grant the user access to it, after that we load the configured database of our wordpress image and then we are ready to roll.

## How can i learn these stuff

WIP
