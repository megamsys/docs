Docker registry

In order to use an image built from an Megam build, you'll need to push that image into a Docker registry. You can use a private Docker registry or the DockerHub.
Private docker registry


To run Docker in a safe robust way for a typical multi-host production environment requires very careful management of many variables:

secured private image repository (index)
orchestrating container deploys with zero downtime
orchestrating container deploy roll-backs
networking between containers on multiple hosts
managing container logs
managing container data (db, etc)
creating images that properly handle init, logs, etc
much much more...


To setup private docker registry you can either follow the registry quick-start or use simple-ruby-app example to host a registry on Megam. In your buildConfig you should pass the fully qualified registry name of the image you want to push myregistry.com:8080/username/imagename.
DockerHub

To push images to the DockerHub you need to login using docker login command. This command will create a file named .dockercfg in your home directory containing your Hub credentials. If you're running the Megam all-in-one as a different user, you'll need to copy this file into that other user's home directory. When the build completes this file will be read by Docker, and the credentials inside of it will be used to push your image.

NOTE: You must tag your built image as <username-for-credentials>/<imagename> when using the DockerHub.
Design Documents

Megam designs:

    Megam 3 PEP
    Orchestration Overview

Kubernetes designs are in the Kubernetes docs dir
API

The Megam APIs are exposed at http://localhost:8080/osapi/v1beta1/*.

    coming soon

The Kubernetes APIs are exposed at http://localhost:8080/api/v1beta1/*:

    http://localhost:8080/api/v1beta1/pods
    http://localhost:8080/api/v1beta1/services
    http://localhost:8080/api/v1beta1/replicationControllers
    http://localhost:8080/api/v1beta1/operations

Several experimental API objects are being prototyped, and should be available soon at:

    http://localhost:8080/osapi/v1beta1/buildConfigs
    http://localhost:8080/osapi/v1beta1/builds
    http://localhost:8080/osapi/v1beta1/deploymentConfigs
    http://localhost:8080/osapi/v1beta1/deployments
    http://localhost:8080/osapi/v1beta1/imageRepositories
    http://localhost:8080/osapi/v1beta1/imageRepositoryMappings
    http://localhost:8080/osapi/v1beta1/images
    http://localhost:8080/osapi/v1beta1/templateConfigs

A draft of the proposed API is available at http://rawgit.com/Megam/origin/master/api/Megam3.html and is developed under the api directory. Expect significant changes.
FAQ

    How does Megam relate to Kubernetes?

    Megam embeds Kubernetes and adds additional functionality to offer a simple, powerful, and easy-to-approach developer and operator experience for building applications in containers. Kubernetes today is focused around composing containerized applications - Megam adds building images, managing them, and integrating them into deployment flows. Our goal is to do most of that work upstream, with integration and final packaging occuring in Megam. As we iterate through the next few months, you'll see this repository focus more on integration and plugins, with more and more features becoming part of Kubernetes.

    Megam tracks the Kubernetes upstream at github.com/Megam/kubernetes. See the wiki in that project for more on how we manage the process of integrating prototyped features.

    What about geard?

    Geard started as a prototype vehicle for the next generation of the Megam node - as an orchestration endpoint, to offer integration with systemd, and to prototype network abstraction, routing, SSH access to containers, and Git hosting. Its intended goal is to provide a simple way of reliably managing containers at scale, and to offer administrators tools for easily composing those applications (gear deploy).

    With the introduction of Kubernetes, the Kubelet, and the pull model it leverages from etcd, we believe we can implement the pull-orchestration model described in orchestrating geard, especially now that we have a path to properly limit host compromises from affecting the cluster.
    The pull-model has many advantages for end clients, not least of which that they are guaranteed to eventually converge to the correct state of the server. We expect that the use cases the geard endpoint offered will be merged into the Kubelet for consumption by admins.

    systemd and Docker integration offers efficient and clean process management and secure logging aggregation with the system. We plan on introducing those capabilities into Kubernetes over time, especially as we work with the Docker upstream to limit the impact of the Docker daemon's parent child process relationship with containers, where death of the Docker daemon terminates the containers under it

    Network links and their ability to simplify how software connects to other containers is planned for Docker links v2 and is a capability we believe will be important in Kubernetes as well (see issue 494 for more details).

    The geard deployment descriptor describes containers and their relationships and will be mapped to deployment on top of Kubernetes. The geard commandline itself will likely be merged directly into the Megam command for all-in-one management of a cluster.



Orchestration Topologies
--------------------------

Orchestration Topologies
https://github.com/Megam/origin/blob/master/docs/orchestration.md

There are three important roles for orchestration at different scales of use:

    from a command line tool, administrators can quickly spin up containers and interconnect them across a few machines
    as an administrator managing a pool of resources centrally who wishes to deploy one or more applications without directly managing assignment
    as a developer or end user deploying an application into a very large resource pool, where administrators control allocation but topology is under the user's control.

For all of the scales of use above, it's desirable to describe and define application topology the same way across those scales. As a client, it should be possible to directly materialize that topology as containers by talking to local components (like Docker) or a local API endpoint. Ideally that API endpoint would be consistent when moving to a high level orchestration tool, so that it's possible to test locally and then deploy remotely.


Connecting Containers
-------------------------


https://github.com/GoogleCloudPlatform/kubernetes/issues/494

CoreOS Cluster Discovery
-----------------------------


Overview

CoreOS uses etcd, a service running on each machine, to handle coordination between software running on the cluster. For a group of CoreOS machines to form a cluster, their etcd instances need to be connected.

A discovery service, https://discovery.etcd.io, is provided as a free service to help connect etcd instances together by storing a list of peer addresses and metadata under a unique address, known as the discovery URL. You can generate them very easily:

$ curl -w "\n" https://discovery.etcd.io/new
https://discovery.etcd.io/6a28e078895c5ec737174db2419bb2f3
The discovery URL can be provided to each CoreOS machine via cloud-config, a minimal config tool that's designed to get a machine connected to the network and join the cluster. The rest of this guide will explain what's happening behind the scenes, but if you're trying to get clustered as quickly as possible, all you need to do is provide a fresh, unique discovery token in your cloud-config.

Boot each one of the machines with identical cloud-config and they should be automatically clustered:

#cloud-config

coreos:
  etcd:
    # generate a new token for each unique cluster from https://discovery.etcd.io/new
    discovery: https://discovery.etcd.io/<token>
    # multi-region and multi-cloud deployments need to use $public_ipv4
    addr: $private_ipv4:4001
    peer-addr: $private_ipv4:7001
  units:
    - name: etcd.service
      command: start
    - name: fleet.service
      command: start
Specific documentation are provided for each platform's guide. Not all providers support the $private_ipv4 variable substitution.

New Clusters

Starting a CoreOS cluster requires one of the new machines to become the first leader of the cluster. The initial leader is stored as metadata with the discovery URL in order to inform the other members of the new cluster. Let's walk through a timeline a new 3 machine CoreOS cluster discovering each other:

All three machines are booted via a cloud-provider with the same cloud-config in the user-data.
Machine 1 starts up first. It requests information about the cluster from the discovery token and submits its peer-addr address 10.10.10.1.
No state is recorded into the discovery URL metadata, so machine 1 becomes the leader and records the state as started.
Machine 2 boots and submits its peer-addr address 10.10.10.2. It also reads back the list of existing peers (only 10.10.10.1) and attempts to connect to the address listed.
Machine 2 connects to Machine 1 and is now part of the cluster as a follower.
Machine 3 boots and submits its peer-addr address 10.10.10.3. It reads back the list of peers ( 10.10.10.1 and 10.10.10.2) and selects one of the addresses to try first. When it connects to a machine in the cluster, the machine is given a full list of the existing other members of the cluster.
The cluster is now bootstrapped with an intial leader and two followers.
There are two interesting things happening during this process.

First, each machine is configured with the same discovery URL and etcd figured out what to do. This allows you to load the same cloud-config into an auto-scaling group and it will work whether it is the first or 30th machine in the group.

Second, machine 3 only needed to use one of the addresses stored in the discovery URL to connect to the cluster. Since etcd uses the Raft consensus algorithm, existing machines in the cluster already maintain a list of healthy members in order for the algorithm to function properly. This list is given to the new machine and it starts normal operations with each of the other cluster members.

Existing Clusters

If you're already operating a bootstrapped cluster with a discovery URL, adding new machines to the cluster is very easy. All you need to do is to boot the new machines with a cloud-config containing the same discovery URL. After boot, the new machines will see that a cluster already exists and attempt to join through one of the addresses stored with the discovery URL.

Over time, as machines come and go, the discovery URL will eventually contain addresses of peers that are no longer alive. Each entry in the discovery URL has a TTL of 7 days, which should be long enough to make sure no extended outages cause an address to be removed erroneously. There is no harm in having stale peers in the list until they are cleaned up, since an etcd instance only needs to connect to one valid peer in the cluster to join.

It's also possible that a discovery URL can contain no existing addresses, because they were all removed after 7 days. This represents a dead cluster and the discovery URL won't work any more and should be discarded.

Common Problems with Cluster Discovery

Invalid Cloud-Config
The most common problem with cluster discovery is using invalid cloud-config, which will prevent the cloud-config from being applied to the machine. The YAML format uses indention to represent data hierarchy, which makes it easy to create an invalid cloud-config. You should always run newly written cloud-config through a YAML validator.

Unfortunately, if you are providing an SSH-key via cloud-config, it can be hard to read the coreos-cloudinit log to find out what's wrong. If you're using a cloud provider, you can normally provide an SSH-key via another method which will allow you to log in. If you're running on bare metal, the coreos.autologin kernel option will bypass authentication, letting you read the journal.

Reading the coreos-cloudinit log will indicate which line is invalid:

journalctl _EXE=/usr/bin/coreos-cloudinit
Stale Tokens
Another common problem with cluster discovery is attempting to boot a new cluster with a stale discovery URL. As explained above, the intial leader election is recorded into the URL, which indicates that the new etcd instance should be joining an existing cluster.

If you provide a stale discovery URL, the new machines will attempt to connect to each of the old peer addresses, which will fail since they don't exist, and the bootstrapping process will fail.

If you're thinking, why can't the new machines just form a new cluster if they're all down. There's a really great reason for this — if an etcd peer was in a network partition, it would look exactly like the "full-down" situation and starting a new cluster would form a split-brain. Since etcd will never be able to determine whether a token has been reused or not, it must assume the worst and abort the cluster discovery.

If you're running into problems with your discovery URL, there are a few sources of information that can help you see what's going on. First, you can open the URL in a browser to see what information etcd is using to bootstrap itself:

{
  action: "get",
  node: {
    key: "/_etcd/registry/506f6c1bc729377252232a0121247119",
    dir: true,
    nodes: [
      {
        key: "/_etcd/registry/506f6c1bc729377252232a0121247119/0d79b4791be9688332cc05367366551e",
        value: "http://10.183.202.105:7001",
        expiration: "2014-08-17T16:21:37.426001686Z",
        ttl: 576008,
        modifiedIndex: 72783864,
        createdIndex: 72783864
      },
      {
        key: "/_etcd/registry/506f6c1bc729377252232a0121247119/c72c63ffce6680737ea2b670456aaacd",
        value: "http://10.65.177.56:7001",
        expiration: "2014-08-17T12:05:57.717243529Z",
        ttl: 560669,
        modifiedIndex: 72626400,
        createdIndex: 72626400
      },
      {
        key: "/_etcd/registry/506f6c1bc729377252232a0121247119/f7a93d1f0cd4d318c9ad0b624afb9cf9",
        value: "http://10.29.193.50:7001",
        expiration: "2014-08-17T17:18:25.045563473Z",
        ttl: 579416,
        modifiedIndex: 72821950,
        createdIndex: 72821950
      }
    ],
    modifiedIndex: 69367741,
    createdIndex: 69367741
  }
}
To rule out firewall settings as a source of your issue, ensure that you can curl each of the IPs from machines in your cluster.

If all of the IPs can be reached, the etcd log can provide more clues:

journalctl -u etcd
Communicating with discovery.etcd.io
If your CoreOS cluster can't communicate out to the public internet, https://discovery.etcd.io won't work and you'll have to run your own discovery endpoint, which is described below.

Setting Peer Addresses Correctly
Each etcd instance submits the -peer-addr of each etcd instance to the configured discovery service. It's important to select an address that all peers in the cluster can communicate with. For example, if you're located in two regions of a cloud provider, configuring a private 10.x address will not work between the two regions, and communication will not be possible between all peers. The --bindaddr flag allows you to bind to a specific interface (or all interfaces) to ensure your etcd traffic is routed properly.

Running Your Own Discovery Service

The public discovery service is just an etcd cluster made available to the public internet. Since the discovery service conducts and stores the result of the first leader election, it needs to be consistent. You wouldn't want two machines in the same cluster to think they were both the leader.

Since etcd is designed to this type of leader election, it was an obvious choice to use it for everyone's initial leader election. This means that it's easy to run your own etcd cluster for this purpose.

If you're interested in how discovery API works behind the scenes in etcd, read about the Discovery Protocol.



etcd Overview

follower
follower
follower
follower
master
M
Logs replicated to each follower in the cluster.
etcd is an open-source distributed key value store that provides the backbone of CoreOS clusters and the etcd client runs on each machine in a cluster. etcd gracefully handles master election during network partitions and the loss of the current master.

Your applications can read and write data into etcd. Common examples are storing database connection details, cache settings, feature flags, and more.

Features

Simple, curl-able API (HTTP + JSON)
Optional SSL client cert authentication
Benchmarked 1000s of writes/s per instance
Properly distributed using Raft protocol
Keys support TTL
Atomic test and set
Easily listen for changes to a prefix via HTTP long-polling
More Information

etcd Getting Started Guide
etcd Documentation etcd on GitHub Projects Using etcd
Technical Overview

etcd is written in Go which has excellent cross-platform support, small binaries and a great community behind it. Communication between etcd machines is handled via the Raft consensus algorithm.

Latency from the etcd master is the most important metric to track and the built-in dashboard has a view dedicated to this. In our testing, severe latency will introduce instability within the cluster because Raft is only as fast as the slowest machine in the majority. You can mitigate this issue by properly tuning the cluster. etcd has been pre-tuned on cloud providers with highly variable networks.

More Information

Presentation: How Raft Works
Securing etcd

etcd should not be exposed outside of the CoreOS cluster. The recommended way to secure your entire cluster (and etcd) is to use a physical firewall, EC2 Security Groups or a similar feature to restrict all traffic unless allowed. Communication within the cluster can be secured with client certificates. Access control lists (ACLs) will be added to etcd in the near future.

If you're running containers that are used for load balancing or caching, consider exposing only those containers instead of all containers.

More Information

Reading and Writing to etcd over HTTPS
Using etcd with docker containers

etcd
etcd
Container starts
Register via etcd
Container stops
Withdrawl via etcd
Container lifecycle and communication with etcd.
Docker containers can read, write and listen to etcd over the docker0 network interface. With these three actions you construct extremely sophisticated orchestration to happen whenever etcd values change.

A common example of listening for changes is to reconfigure an upstream proxy when a new container of an application is started.

To keep service registration logic outside of your main codebase, "sidekick" units can be run next to the main systemd unit. Sidekicks will be scheduled by fleet onto the same machine as the main unit and will stop if the main unit stops for any reason.

More Information

Read more about docker + CoreOS
