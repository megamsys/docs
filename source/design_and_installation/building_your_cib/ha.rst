.. _ha:

=================================
An Overview of High Availability
=================================

This section looks at the basic components of an CIB organizes them into one of the more common reference architectures. You'll then use that architecture as a basis for installing CIB in the next section.

As you know, CIB provides the following basic services:

Compute:
    Compute servers are the workhorses of your installation; they're the servers on which your users' virtual machines are created. OpenNebula Host controls the life cycle of these VMs.

Storage:
    Storage Node is optional. CIB provides the following storage options out of the box: Ceph provides object and  block storage to virtual machines

PaaS:
    Platform as a Service is provide by Megam

Compute, Storage, PaaS can be combined in many different ways. Out of the box, CIB supports the following deployment configurations:

-  **Multi-node Deployment**
-  **Multi-node with HA**

More commonly, your CIB installation will consist of multiple servers. We provide ``2``, ``3``, ``4`` node topology and many can be added up to you requirement, of course, but the main idea is that your conrolling softwares (OpenNebula FrontEnd, Megam) are separate from your compute servers, on which your users' VMs will actually run. Please read the `Planning CIB <plancib>` for details on ``Multi node deployment``

Multi-node with HA Deployment
------------------------------

Production environments typically require high availability, which involves several architectural requirements. Specifically, you will need at least ```4`` nodes, and certain components will be deployed in multiple nodes to prevent single points of failure.

We'll take a closer look at the details of this deployment configuration in **How Multi-node with HA Deployment works** section.

|megam ha arch|

How Multi-node with HA Deployment works
-----------------------------------------
OpenNebula and Megam services are interconnected by `RESTful <http://en.wikipedia.org/wiki/Representational_state_transfer>`_ HTTP-based APIs, Google Proto Buffer-based RPC and AMQP-based RPC messages. So redundancy for stateless Megam/OpenNebula services is implemented through the combination of Virtual IP (VIP) management using Pacemaker and load balancing using HAProxy. Stateful OpenNebula components, Megam Components such as the database and messaging server, rely on their respective active/active and active/passive modes for high availability. For example, RabbitMQ, Riak, ElasticSearch uses built-in clustering capabilities.

Lets take a closer look at what an CIB deployment looks like, and what it will take to achieve high availability for an CIB deployment.

A CIB Multi-node HA environment involves three types of nodes: front-end nodes, compute nodes, and storage nodes.

Front-end Nodes
    The first order of business in achieving high availability (HA) is redundancy, so the first step is to provide multiple front-end nodes.

Every Front-end node (``CIB Base Unit #1``, ``CIB HA Unit#4``) runs HAProxy, which manages a single External Virtual IP (VIP) for all front-end nodes and provides HTTP and TCP load balancing of requests going to OpenNebula & Megam services, RabbitMQ, Riak,  and ElasticSearch.

When an end user accesses the OpenNebula cloud using Sunstone (or) Megam PaaS using Nilavu (or) makes a request to the REST API for services the request goes to the live front-end node currently holding the External VIP, and the connection gets handled by HAProxy. When the next request comes in, HAProxy handles it, and may send it to the original front-end or another in the environment, depending on load conditions.

Each of the services housed on the controller nodes has its own mechanism for achieving HA:

-  cobbler, nilavu, snowflake, gateway, megamd, etcd, tap, varai, heka and ``oned & [other OpenNebula services]`` are stateless services that do not require any special attention besides load balancing.
-  Sunstone, Nilavu as a typical web application, requires sticky sessions to be enabled at the load balancer.
-  RabbitMQ provides active/active high availability using mirrored queues.
-  Riak high availability is achieved through built-in clustering.
-  Ceph monitors implement their own quorum based HA mechanism and require time synchronization between all nodes. Clock drift higher than 50ms may break the quorum or even crash the Ceph service.

Compute Nodes
  OpenNebula compute nodes are, in many ways, the foundation of your environment; they are the servers on which your users will create their Virtual Machines (VMs) and host their applications. Compute nodes need to talk to front-end nodes and reach out to essential services such as a database. They use the same approach that provides redundancy to the end-users of Sunstone and REST APIs, reaching out to controller nodes using the VIP and going through HAProxy.

Storage Nodes
  Ceph implements its own HA, all you need is enough controller nodes running Ceph Monitor service to form a quorum, and enough Ceph OSD nodes to satisfy the object replication factor.

Cluster Sizing
  This reference architecture is well suited for production-grade CIB deployments on a medium and large scale when you can afford allocating several servers for your OpenNebula frontcontroller nodes in order to build a fully redundant and highly available environment.

The absolute minimum requirement for a highly-available CIB deployment is to allocate 4 nodes:

    2 front-end nodes
    1 storage node
    1 compute node

.. warning:: We only have 1 storage node with 3 OSDs running in individual hard drives. Hence to make the storage node highly available an additional node needs to be added. Please read :ref:`CIB Storage Overview <storage>` for more details.

Network Architecture
  For better network performance and manageability, Fuel place different types of traffic into separate networks. This section describes how to distribute the network traffic in CIB using an OpenNebula cluster.

Public Network
  This network allows inbound connections to VMs from the outside world (allowing users to connect to VMs from the Internet). It also allows outbound connections from VMs to the outside world. For security reasons, the public network is usually isolated from other networks in cluster. The word "Public" means that these addresses can be used to communicate with cluster and its VMs from outside of cluster.

To enable external access to VMs, the public network provides the address space for the floating IPs assigned to individual VM instances by the project administrator.  `OpenNebula Virtual Network <http://docs.opennebula.org/4.10/user/references/vnet_template.html#vnet-template>`_  can then configure this address on the public network interface of the ``CIB Node #2 (OpenNebula Host)``. Private IP of the corresponding VM instance through the appropriate virtual bridge interface on the ``CIB Node #2 (OpenNebula Host)``.

In the other direction, the public network provides connectivity to the globally routed address space for VMs. The IP address from the public network that has been assigned to a compute node is used as the source for the Source NAT performed for traffic going from VM instances on the compute node to Internet.

The public network also provides Virtual IPs for Endpoint nodes, which are used to connect to OpenStack services APIs.

Internal CIB Network
  The internal network connects all CIB nodes in the environment. All components of an CIB environment communicate with each other using this network. This network must be isolated from both the private and public networks for security reasons.

The internal network can also be used for serving exchanges between Compute and Storage nodes.

Private Network
  The private network facilitates communication between each tenant's VMs. Private network address spaces are not a part of the enterprise network address space. Fixed IPs of virtual instances are directly unaccessible from the rest of Enterprise network.


.. |megam ha| image:: /images/megam_cib_ha.png
.. |megam ha arch| image:: /images/megam_cib_ha_arch.png
