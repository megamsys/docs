
Overview

Before you install any hardware or software, you must know what you're trying to achieve. This section looks at the basic components of an OpenStack infrastructure and organizes them into one of the more common reference architectures. You'll then use that architecture as a basis for installing OpenStack in the next section.

As you know, OpenStack provides the following basic services:

Compute:
    Compute servers are the workhorses of your installation; they're the servers on which your users' virtual machines are created. nova-compute controls the life cycle of these VMs.
Networking:

    Typically, an OpenStack environment includes multiple servers that need to communicate to each other and to outside world. Fuel supports both old nova-network and new neutron based OpenStack Networking implementations:

        With nova-network, Flat-DHCP and VLAN modes are available.
        With neutron, GRE tunnels or VLANs can be used for network segmentation.

Storage:

    OpenStack requires block and object storage to be provisioned. Fuel provides the following storage options out of the box:

        Cinder LVM provides persistent block storage to virtual machines over iSCSI protocol
        Swift object store can be used by Glance to store VM images and snapshots, it may also be used directly by applications
        Ceph combines object and block storage and can replace either one or both of the above.

Compute, Networking, and Storage services can be combined in many different ways. Out of the box, Fuel supports the following deployment configurations:

    Multi-node
    Multi-node with HA
    RHOS Multi-node
    RHOS Multi-node with HA
    Multi-node Deployment

In a production environment, you will not likely ever have a Multi-node deployment of OpenStack, partly because it forces you to make a number of compromises as to the number and types of services that you can deploy. It is, however, extremely useful if you just want to see how OpenStack works from a user's point of view.

More commonly, your OpenStack installation will consist of multiple servers. Exactly how many is up to you, of course, but the main idea is that your controller(s) are separate from your compute servers, on which your users' VMs will actually run. One arrangement that will enable you to achieve this separation while still keeping your hardware investment relatively modest is to house your storage on your controller nodes.

Multi-node with HA Deployment

Production environments typically require high availability, which involves several architectural requirements. Specifically, you will need at least three controllers, and certain components will be deployed in multiple locations to prevent single points of failure. That's not to say, however, that you can't reduce hardware requirements by combining your storage, network, and controller nodes:

We'll take a closer look at the details of this deployment configuration in Details of Multi-node with HA Deployment section.



Details of Multi-node with HA Deployment

OpenStack services are interconnected by RESTful HTTP-based APIs and AMQP-based RPC messages. So redundancy for stateless OpenStack API services is implemented through the combination of Virtual IP (VIP) management using Pacemaker and load balancing using HAProxy. Stateful OpenStack components, such as the state database and messaging server, rely on their respective active/active and active/passive modes for high availability. For example, RabbitMQ uses built-in clustering capabilities, while the database uses MySQL/Galera replication.

Lets take a closer look at what an OpenStack deployment looks like, and what it will take to achieve high availability for an OpenStack deployment.
Red Hat OpenStack Architectures

Red Hat has partnered with Mirantis to offer an end-to-end supported distribution of OpenStack powered by Fuel. Because Red Hat offers support for a subset of all available open source packages, the reference architecture has been slightly modified to meet Red Hat's support requirements to provide a highly available OpenStack environment.

Below is the list of modifications:

Database backend:
    MySQL with Galera has been replaced with native replication in a Master/Slave configuration. MySQL master is elected via Corosync and master and slave status is managed via Pacemaker.
Messaging backend:
    RabbitMQ has been replaced with QPID. Qpid is an AMQP provider that Red Hat offers, but it cannot be clustered in Red Hat's offering. As a result, Fuel configures three non-clustered, independent QPID brokers. Fuel still offers HA for messaging backend via virtual IP management provided by Corosync.
Nova networking:
    Neutron (Quantum) is not available for Red Hat OpenStack because the Red Hat kernel lacks GRE tunneling support for OpenVSwitch. This issue should be fixed in a future release. As a result, Fuel for Red Hat OpenStack Platform will only support Nova networking.

Multi-node Red Hat OpenStack Deployment

In a production environment, it is not likely you will ever have a Multi-node deployment of OpenStack, partly because it forces you to make a number of compromises as to the number and types of services that you can deploy. It is, however, extremely useful if you just want to see how OpenStack works from a user's point of view.

More commonly, your OpenStack installation will consist of multiple servers. Exactly how many is up to you, of course, but the main idea is that your controller(s) are separate from your compute servers, on which your users' VMs will actually run. One arrangement that will enable you to achieve this separation while still keeping your hardware investment relatively modest is to house your storage on your controller nodes.
Multi-node with HA Red Hat OpenStack Deployment

Production environments typically require high availability, which involves several architectural requirements. Specifically, you will need at least three controllers, and certain components will be deployed in multiple locations to prevent single points of failure. That's not to say, however, that you can't reduce hardware requirements by combining your storage, network, and controller nodes:

OpenStack services are interconnected by RESTful HTTP-based APIs and AMQP-based RPC messages. So redundancy for stateless OpenStack API services is implemented through the combination of Virtual IP (VIP) management using Corosync and load balancing using HAProxy. Stateful OpenStack components, such as the state database and messaging server, rely on their respective active/passive modes for high availability. For example, MySQL uses built-in replication capabilities (plus the help of Pacemaker), while QPID is offered in three independent brokers with virtual IP management to provide high availability.
HA Logical Setup

An OpenStack Multi-node HA environment involves three types of nodes: controller nodes, compute nodes, and storage nodes.
Controller Nodes

The first order of business in achieving high availability (HA) is redundancy, so the first step is to provide multiple controller nodes.

As you may recall, the database uses Galera to achieve HA, and Galera is a quorum-based system. That means that you should have at least 3 controller nodes.

Every OpenStack controller runs HAProxy, which manages a single External Virtual IP (VIP) for all controller nodes and provides HTTP and TCP load balancing of requests going to OpenStack API services, RabbitMQ, and MySQL.

When an end user accesses the OpenStack cloud using Horizon or makes a request to the REST API for services such as nova-api, glance-api, keystone-api, quantum-api, nova-scheduler, MySQL or RabbitMQ, the request goes to the live controller node currently holding the External VIP, and the connection gets terminated by HAProxy. When the next request comes in, HAProxy handles it, and may send it to the original controller or another in the environment, depending on load conditions.

Each of the services housed on the controller nodes has its own mechanism for achieving HA:

    nova-api, glance-api, keystone-api, quantum-api and nova-scheduler are stateless services that do not require any special attention besides load balancing.
    Horizon, as a typical web application, requires sticky sessions to be enabled at the load balancer.
    RabbitMQ provides active/active high availability using mirrored queues.
    MySQL high availability is achieved through Galera active/active multi-master deployment and Pacemaker.
    Quantum agents are managed by Pacemaker.
    Ceph monitors implement their own quorum based HA mechanism and require time synchronization between all nodes. Clock drift higher than 50ms may break the quorum or even crash the Ceph service.

Compute Nodes

OpenStack compute nodes are, in many ways, the foundation of your environment; they are the servers on which your users will create their Virtual Machines (VMs) and host their applications. Compute nodes need to talk to controller nodes and reach out to essential services such as RabbitMQ and MySQL. They use the same approach that provides redundancy to the end-users of Horizon and REST APIs, reaching out to controller nodes using the VIP and going through HAProxy.
Storage Nodes

Depending on the storage options you select for your environment, you may have Ceph, Cinder, and Swift services running on your storage nodes.

Ceph implements its own HA, all you need is enough controller nodes running Ceph Monitor service to form a quorum, and enough Ceph OSD nodes to satisfy the object replication factor.

Swift API relies on the same HAProxy setup with VIP on controller nodes as the other REST APIs. If don't expect too much data traffic in Swift, you can also deploy Swift Storage and Proxy services on controller nodes. For a larger production environment you'll need dedicated nodes: two for Swift Proxy and at least three for Swift Storage.

Whether or not you'd want separate Swift nodes depends primarily on how much data you expect to keep there. A simple test is to fully populate your Swift object store with data and then fail one controller node. If replication of the degraded Swift objects between the remaining nodes controller generates enough network traffic, CPU load, or disk I/O to impact performance of other OpenStack services running on the same nodes, you should separate Swift from controllers.

If you select Cinder LVM as the block storage backend for Cinder volumes, you should have at least one Cinder LVM node. Unlike Swift and Ceph, Cinder LVM doesn't implement data redundancy across nodes: if a Cinder node is lost, volumes stored on that node cannot be recovered from the data stored on other Cinder nodes. If you need your block storage to be resilient, use Ceph for volumes.
Cluster Sizing

This reference architecture is well suited for production-grade OpenStack deployments on a medium and large scale when you can afford allocating several servers for your OpenStack controller nodes in order to build a fully redundant and highly available environment.

The absolute minimum requirement for a highly-available OpenStack deployment is to allocate 4 nodes:

    3 controller nodes, combined with storage
    1 compute node

If you want to run storage separately from the controllers, you can do that as well by raising the bar to 9 nodes:

    3 Controller nodes
    3 Storage nodes
    2 Swift Proxy nodes
    1 Compute node

Of course, you are free to choose how to deploy OpenStack based on the amount of available hardware and on your goals (such as whether you want a compute-oriented or storage-oriented environment).

For a typical OpenStack compute deployment, you can use this table as high-level guidance to determine the number of controllers, compute, and storage nodes you should have:
# of Nodes 	Controllers 	Computes 	Storages
4-10 	3 	1-7 	3 (on controllers)
11-40 	3 	3-32 	3+ (swift) + 2 (proxy)
41-100 	4 	29-88 	6+ (swift) + 2 (proxy)
>100 	5 	>84 	9+ (swift) + 2 (proxy)
Network Architecture

For better network performance and manageability, Fuel place different types of traffic into separate networks. This section describes how to distribute the network traffic in an OpenStack cluster.
Public Network

This network allows inbound connections to VMs from the outside world (allowing users to connect to VMs from the Internet). It also allows outbound connections from VMs to the outside world. For security reasons, the public network is usually isolated from other networks in cluster. The word "Public" means that these addresses can be used to communicate with cluster and its VMs from outside of cluster.

To enable external access to VMs, the public network provides the address space for the floating IPs assigned to individual VM instances by the project administrator. Nova Network or Neutron services can then configure this address on the public network interface of the Network controller node. E.g. environments based on Nova Network use iptables to create a Destination NAT from this address to the private IP of the corresponding VM instance through the appropriate virtual bridge interface on the Network controller node.

In the other direction, the public network provides connectivity to the globally routed address space for VMs. The IP address from the public network that has been assigned to a compute node is used as the source for the Source NAT performed for traffic going from VM instances on the compute node to Internet.

The public network also provides Virtual IPs for Endpoint nodes, which are used to connect to OpenStack services APIs.
Internal (Management) Network

The internal network connects all OpenStack nodes in the environment. All components of an OpenStack environment communicate with each other using this network. This network must be isolated from both the private and public networks for security reasons.

The internal network can also be used for serving iSCSI protocol exchanges between Compute and Storage nodes.
Private Network

The private network facilitates communication between each tenant's VMs. Private network address spaces are not a part of the enterprise network address space. Fixed IPs of virtual instances are directly unaccessible from the rest of Enterprise network.
NIC usage

The current architecture assumes the presence of 3 NICs, but it can be customized for two or 4+ network interfaces. Most servers are built with at least two network interfaces. In this case, let's consider a typical example of three NIC cards. They're utilized as follows:

eth0:
    The internal management network, used for communication with Puppet & Cobbler
eth1:
    The public network, and floating IPs assigned to VMs
eth2:
    The private network, for communication between OpenStack VMs, and the bridge interface (VLANs)

The figure below illustrates the relevant nodes and networks in Neutron VLAN mode.
Storage Architecture
Object Storage for Images

Fuel can configure one of these storage backends for the Glance image service:

        File system backend,
        Swift object store, the standard OpenStack object storage component,
        Ceph RBD, the distributed block device service based on RADOS, the object store component of the Ceph storage platform.

By default, Glance stores virtual machine images using the file system backend. With it, you can use any of the shared file systems supported by Glance. Fuel will default to this option in a simple non-HA deployment with a local file system on a single controller node.

For a production HA environment where you want data resilience for VM images, the best practice is to use an object store as the backend for Glance. That way, multiple Glance instances running on controller nodes can store and retrieve images from the same data set, while the object store takes care of data protection and HA.

In HA deployment mode, Fuel will default to using Swift as the storage backend for Glance instead of the file system backend. In both HA and non-HA multi-node configurations, Fuel will also offer you the option to use Ceph as storage backend.

The primary advantage of using Ceph RBD for images is the ability to unify different classes of data into a single shared pool of storage nodes that can handle all classes of data important for OpenStack. Instead of having to copy OS images and volumes between separate Glance, Cinder, and Nova storage pools, you can have all three services use copy-on-write clones of the original image. In addition to better utilization of storage capacity, copy-on-write also significantly speeds up launching VMs from images.

To make the most out of the copy-on-write capability of the Ceph backend, you should only use images in raw format. Images in other formats such as qcow2 have to be converted to raw format first and cannot be cloned without conversion.

As of this writing, vanilla OpenStack Havana release placed several important limitations on the copy-on-write capability of the Ceph backend:

        You have to create an RBD backed bootable volume from a raw image for copy-on-write and live migrations to work;
        Launching an instance directly from image results in a full copy on the compute node instead of a copy-on-write clone in Ceph;
        Ephemeral drives are stored in local files on compute nodes instead of Ceph, preventing live migration of instances with ephemenral drives;
        Non-raw images are not converted to raw automatically when creating a bootable volume: if you don't convert the image yourself, you will end up with a clone of a qcow2 image that will not be bootable.

These limitations are removed in Mirantis OpenStack distribution starting with release 4.0.
Object Storage for Applications

The objects storage systems supported by Mirantis OpenStack don't have to be limited to serving Glance. Swift provides a REST API that can be used by any application that needs to store data in an object store, and is immediately available whenever you have Swift running.

Ceph includes the optional radosgw object gateway component which allows to access objects in RADOS object store using REST interfaces compatible with Amazon S3 and Swift APIs.

Ceph RBD backend for Glance doesn't use Swift API and uses RADOS directly, so it is possible to store Glance images in Ceph and still use Swift as object store for applications. This does not work the other way around: when you choose to install the Ceph object gateway, it replaces Swift as the provider of Swift API, so you can't have both radosgw and Swift in the same OpenStack environment.
Block Storage for Volumes

When you configure Mirantis OpenStack to use the default LVM backend for Cinder block devices, Cinder will store each volume as a logical volume in an LVM volume group on one of your Cinder nodes.

If you don't need your volumes to be resilient, you can let Fuel create a JBOD partition spanning all your storage drives in a node during deployment, or you can join all drives into a RAID array before deployment, and have the array appear to Fuel as a single block device. Even if you use RAID in each Cinder node, that only protects your data from a hard drive failure. If the whole Cinder node is lost, so are all volumes that were stored on that node.

Setting Cinder backend to Ceph RBD allows to take advantage of Ceph's object replication capabilities by storing Cinder volumes as objects in Ceph RADOS object storage system. By default, Ceph simply ensures that every replica of an object is stored on a different node. The set of data replication rules (CRUSH map) can be customized separately for each object pool to change the number of object replicas, add different types of failure domains, etc. The amount of storage required to host your volumes will be multiplied by the replication factor you configure for Ceph, but your volumes will be protected from node or even data center failure.

If you combine RBD backends for Cinder and Glance, you gain another important advantage over Cinder LVM: copy-on-write cloning of Glance images into bootable Ceph volumes.
Technical Considerations

Before performing any installations, you'll need to make a number of decisions about which services to deploy, but from a general architectural perspective, it's important to think about how you want to handle both networking and block storage.
Neutron vs. nova-network

Neutron (formerly Quantum) is a service which provides Networking-as-a-Service functionality in OpenStack. It has a rich tenant-facing API for defining network connectivity and addressing in the cloud, and gives operators the ability to leverage different networking technologies to power their cloud networking.

There are various deployment use cases for Neutron. Fuel supports the most common of them, called Per-tenant Routers with Private Networks. Each tenant has a virtual Neutron router with one or more private networks, which can communicate with the outside world. This allows full routing isolation for each tenant private network.

Neutron is not, however, required in order to run an OpenStack environment. If you don't need (or want) this added functionality, it's perfectly acceptable to continue using nova-network.

In order to deploy Neutron, you need to enable it in the Fuel configuration. Fuel sets up Neutron components on each of the controllers to act as a router in HA (if deploying in HA mode).
Terminology

    Public network (also known as External network) used for Internet access for all nodes.
    Floating IP network subnet within public network allocated for tenant Internet access. A Neutron server directly assigns IP addresses for this network. If a user delegates a floating IP address to an instance, an IP address will be assigned from this subnet (by SNAT/DNAT).
    Private network used for passing tenant private traffic.
    Admin network shared network between Fuel Master and all nodes in the cluster for PXE installation and orchestration of environment for deployment.
    Storage network network used for communicating between storage nodes (using Ceph, swift, or cinder) and compute nodes.
    Management network (also known as Internal) used for necessary communication between controllers and computes for AMQP messaging, DB queries, other inter-controller traffic required for supporting services.
    Router virtual Neutron router.
    NIC network interface card (ethernet adapter).

Overview

OpenStack networking with Neutron (Quantum) has some differences from Nova-network. Neutron is able to virtualize and manage both layer 2 (logical) and layer 3 (network) of the OSI network model, as compared to simple layer 3 virtualization provided by nova-network. This is the main difference between the two networking models for OpenStack. Virtual networks (one or more) can be created for a single tenant, forming an isolated L2 network called a "private network". Each private network can support one or many IP subnets. Private networks can be segmented using two different technologies:

    VLAN segmentation "Private network" traffic is managed by Neutron by the use of a dedicated network adapter. This network adapter must be attached to a untagged network port. This network segment also must be reserved only for Neutron on each host (Computes and Controllers). You should not use any other 802.1q VLANs on this network for other purposes. Additionally, each private network requires its own dedicated VLAN, selected from a given range configured in Fuel UI.
    GRE segmentation In this mode of operation, Neutron does not require a dedicated network adapter. Neutron builds a mesh of GRE tunnels from each compute node and controller nodes to every other node. Private networks for each tenant make use of this mesh for isolated traffic.

It is important to note:

    if you use tagged networks for your configuration and combine multiple networks onto one NIC, you should make the Public network untagged on this NIC. It is not a requirement, but best for access to the OpenStack Dashboard and public OpenStack API.
    Is a best if you place the Private, Admin, Public and Management networks on a separate NIC to ensure that traffic is separated adequately.
    Admin and Private networks must be located together on separate NIC from the other networks.

A typical network configuration for Neutron with VLAN segmentation might look like this:
_images/Neutron_32_vlan_v2.png

A typical network configuration for Neutron with GRE segmentation might look like this:
_images/Neutron_32_gre_v2.png

The most likely configuration for different number NICs on cluster nodes:
NICs 	VLAN 	GRE
2 	Not supported
3

4

Known limitations

    Neutron will not allocate a floating IP range for your tenants. After each tenant is created, a floating IP range must be created. Note that this does not
        prevent Internet connectivity for a tenant's instances, but it would prevent them from receiving incoming connections. You, the administrator, should assign a floating IP addresses for the tenant. Below are steps you can follow to do this:
    get admin credentials:
    # source /root/openrc
    get admin tenant-ID:
    # keystone tenant-list
    id 	name 	enabled
    b796f91df6b84860a7cd474148fb2229 	admin 	True
    cba7b0ff68ee4985816ac3585c8e23a9 	services 	True
    create one floating-ip address for admin tenant:
    # quantum floatingip-create --tenant-id=b796f91df6b84860a7cd474148fb2229 net04_ext

    You can't combine Private or Admin network with any other networks on one NIC.

    To deploy OpenStack using Neutron with GRE segmentation, each node requires at least 2 NICs.

    To deploy OpenStack using Neutron with VLAN segmentation, each node requires at least 3 NICs.
