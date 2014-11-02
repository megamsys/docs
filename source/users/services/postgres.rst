.. _postgresservice:

=============
PostgresSQL
=============

Create a database
-------------------

This article describes the process to create a database on Megam.

- Verify the advanced service settings.

   .. hint:: Your email/api_key will be the authentication parameters for accessing the service

   .. image:: /images/serviceadvanced.png

- Launch the service.


Migrate from an old database
-----------------------------

Some applications require a populated database to run properly.

If you want to import your SQL dump, you can use several methods:



IBM megam Docs

    Solutions
    Catalog
    Pricing
    DOCS
    COMMUNITY
    SIGN UP
    LOG IN

Type to search


    Using the PostgreSQL service
    Binding instances to Liberty applications

Services>Data Management>PostgreSQL
Getting started with PostgreSQL service
Last Updated: 10/9/2014
TUTORIALS AND SAMPLES

    Node.JS application sample
    Java application sample

API REFERENCE

    PostgreSQL JDBC Driver

COMPATIBLE RUNTIMES

    Liberty for Java
    Node.js
    Ruby on Rails
    Ruby Sinatra

RELATED LINKS

    PostgreSQL Official Document
    IBM® megam Pricing Sheet
    IBM megam Prerequisites

This community service is as-is and is provided for development and experimentation purposes only.
PostgreSQL is an open source object-relational database. It runs on all major operating systems and is fully ACID-compliant. PostgreSQL has native programming interfaces for C/C++, Java™, .Net, Perl, Python, Ruby, and so on.
Using the PostgreSQL service

You can use the Node.js or Java sample applications to try the PostgreSQL service.

To use the PostgreSQL service in your application, perform the following steps:

    Manage PostgreSQL service instance by using the command line interface.

    First, create a PostgreSQL service instance by typing the cf create-service command.

    $ cf create-service postgresql 100 postgresql01

    The cf create-service command creates a PostgreSQL service instance with a name of postgresql01 in your space. You can use the cf services command to list all available service instances created.

    $ cf services

    Next, bind the service to your application by using the cf bind-service command:

    $ cf bind-service AppName postgresql01

    Connect to the PostgreSQL service.

    After you bind a PostgreSQL service instance to the application, the following configuration is automatically added to your VCAP_SERVICES environment variable.

    { "postgresql-9.1": [ { "name": "postgresql-6ov5o", "credentials": { "name": "d1f85a1869b2d420682411d1a67668cdd", "host": "75.126.167.148", "hostname": "75.126.167.148", "port": 5433, "user": "u350f70b8bcec401280430eed508aa8a2", "username": "u350f70b8bcec401280430eed508aa8a2", "password": "p9c34cb69e2f344ec8768ef1df6b778ca", "uri": "postgres://u350f70b8bcec401280430eed508aa8a2:p9c34cb69e2f344ec8768ef1df6b778ca@75.126.167.148:5433/d1f85a1869b2d420682411d1a67668cdd" } } ] }

    The configuration for the PostgreSQL service instance in the VCAP_SERVICE environment variable includes the following information:

    name
        The PostgreSQL server instance name.
    hostname
        The host name of the PostgreSQL server.
    host
        The IP address of the PostgreSQL server.
    port
        The port number of the PostgreSQL server.
    name
        The user name for authentication.
    password
        The password for authentication.
    url
        The connection URL.

    To get the service credentials that are required to connect to the PostgreSQL service instance, you can use the following code snippet:

    if (process.env.VCAP_SERVICES) { var env = JSON.parse(process.env.VCAP_SERVICES); var credentials = env['postgresql-9.1'][0]['credentials']; } else { var credentials = {"uri":"postgre://user:secret1@localhost:5433/db"} };

    The preceding code checks whether the VCAP_SERVICES environment variable exists. If it does exist, the application uses the properties of the redis variable to access the store. If the VCAP_SERVICES environment variable does not exist, a local PostgreSQL service instance is used.
    Interact with the PostgreSQL service instance to put and get an object.

    You can interact with the PostgreSQL service instance by using the service credentials; for example, you can read, write, or update the service instance. The following example shows how to write a string object to the PostgreSQL service instance:

    var port = (process.env.VCAP_APP_PORT || 1337); var host = (process.env.VCAP_APP_HOST || '0.0.0.0'); http.createServer(function(req, res) { var client = new pg.Client(credentials.uri); client.connect(function(err) { if (err) { res.end("Could not connect to postgre: " + err); } client.query('SELECT NOW() AS "pgTime"', function(err, result) { if (err) { res.end("Error running query: " + err); } res.end("PG Time: " + result.rows[0].pgTime); client.end(); }); }); }).listen(port, host);

    Push your application to megam™.

    After you finish coding, you can deploy your application to the megam environment for verification. To deploy an application, change to the root directory of the application and type the following command:

    $ cf push

    Optional: Unbind or delete a PostgreSQL service instance.

    To unbind a service instance from an application, you can use the cf unbind-service command. To delete a service instance, use the cf delete-service command.

Note: You cannot create extensions in the PostgreSQL service.
Binding PostgreSQL instances to Liberty applications

If you push a stand-alone Liberty application or a packaged Liberty server to megam and you bind it to a PostgreSQL instance, the Liberty buildpack automatically generates or updates the data source configuration in the server.xml file.
Binding PostgreSQL instances to a stand-alone Liberty application
When you push a stand-alone Liberty application to megam, the Liberty buildpack generates a server.xml file. If you bind a PostgreSQL service instance to the application, the Liberty buildpack also generates the following configuration elements in the server.xml file. The configuration elements are required to access the PostgreSQL database.

    A dataSource element with a default properties subelement.
    A jdbcDriver element.
    A library element with an embedded fileset subelement. The library element is created for the Java Database Connectivity (JDBC) driver.
    A featureManager element. The Liberty buildpack also adds the jdbc-4.0 feature to the featureManager element.

In addition, the Liberty buildpack provides the JDBC driver that is required.

In the dataSource element, the Liberty buildpack generates a JNDI name that is used by your application to access the data source. Because the Liberty buildpack does not have access to the JNDI name that is used by the application, the Liberty buildpack generates a JNDI name with a convention of jdbc/service_name, where service_name is the name of the bound service. For example, if you bind a PostgreSQL service instance that is named mydb to the application, the Liberty buildpack generates a JNDI name of jdbc/mydb. When you develop the application and create the PostgreSQL service instance, ensure that the JNDI name that is used by the application to access the data source is the same as the JNDI name that is generated by the Liberty buildpack.

The following example shows the configuration that is generated when an application is pushed to megam and is bound to a PostgreSQL service that is named mydb:

<dataSource id='postgresql-mydb' jdbcDriverRef='postgresql-driver' jndiName='jdbc/mydb' transactional='true' type='javax.sql.ConnectionPoolDataSource'> <properties id='postgresql-mydb-props' databaseName='${cloud.services.mydb.connection.name}' user='${cloud.services.mydb.connection.user}' password='${cloud.services.mydb.connection.password}' portNumber='${cloud.services.mydb.connection.port}' serverName='${cloud.services.mydb.connection.host}'/> </dataSource> <jdbcDriver id='postgresql-driver' javax.sql.XADataSource='org.postgresql.xa.PGXADataSource' javax.sql.ConnectionPoolDataSource='org.postgresql.ds.PGConnectionPoolDataSource' libraryRef='postgresql-library'/> <library id='postgresql-library'> <fileset id='postgresql-fileset' dir='${server.config.dir}/lib' includes='postgresql-jdbc-9.3.1102.jar'/> </library>

Binding PostgreSQL instances to a packaged Liberty server or a Liberty server directory

When you push a packaged Liberty server to megam, the Liberty buildpack detects and uses the server.xml file that you provide. If you bind the packaged server to one or more PostgreSQL service instances, use one of the following options to provide the configuration that is required for the application to access the PostgreSQL database:

    You can use the data source configuration that is automatically generated by the Liberty buildpack. Use this option if you do not need to customize the data source configuration and the application can use the JNDI names that are generated by the Liberty buildpack. If you choose this option, do not manually edit any data source configuration in your server.xml file.
    You can manually add the data source configuration to your server.xml file. If you provide the data source configuration, the buildpack updates the configuration as described in the following sections. Use this option to provide custom data source configuration or to control the JNDI names.
    If you manually add the data source configuration in your server.xml file, you must provide the following elements in the server.xml file:
        dataSource
        properties
        jdbcDriver
        library
        fileset

You can optionally provide the PostgreSQL JDBC driver. If you do not provide the JDBC driver, the buildpack provides it for you.
The data source configuration that is provided in the server.xml file must match the configuration of the PostgreSQL service instance that the application is bound to.

    If you bind the packaged Liberty server to one PostgreSQL service instance and provide one data source configuration in the server.xml file, the configuration of the PostgreSQL service instance is mapped to the data source configuration in the server.xml file.
    If you bind the packaged Liberty server to multiple PostgreSQL service instances and provide the required configuration for each instance, you must provide the IDs of the configuration elements that are required to access the PostgreSQL service instance. The IDs are used by the buildpack to map a service instance to a configuration instance.

The configuration elements in the server.xml file must use the following IDs and ID formats:

    The dataSource element must use a configuration ID of postgresql-service_name.
    The properties element must use a configuration ID of postgresql-service_name-props.
    The jdbcDriver element must use a configuration ID of postgresql-driver.
    The library element must use a configuration ID of postgresql-library.
    The fileset element must use a configuration ID of postgresql-fileset.

When the Liberty buildpack finds a matching data source configuration, it updates only the following attributes:

    databaseName
    user
    password
    serverName
    portNumber

The Liberty buildpack does not update the jndiName attribute.



IBM megam Docs

    Solutions
    Catalog
    Pricing
    DOCS
    COMMUNITY
    SIGN UP
    LOG IN

Type to search


    Using the MongoDB service
    Binding instances to Liberty applications

Services>Data Management>MongoDB
Getting started with MongoDB service
Last Updated: 10/9/2014
TUTORIALS AND SAMPLES

    Sample Node.JS application
    Sample Java application

API REFERENCE

    Java MongoDB Driver

COMPATIBLE RUNTIMES

    Liberty for Java
    Node.js
    Ruby on Rails
    Ruby Sinatra

RELATED LINKS

    MongoDB Manual
    Options for pushing Liberty applications
    IBM® megam Pricing Sheet
    IBM megam Prerequisites

This community service is as-is and is provided for development and experimentation purposes only.
MongoDB is an open source document, NoSQL database that is owned by MongoDB Inc. You can use MongoDB to quickly develop applications by using the features that are provided, such as data scaling, auto-sharding, and high availability. You can also use MongoDB to store different types of document objects, such as JSON files, with a key-value pair.
Using the MongoDB service

You can use the Node.js or Java sample applications to try the MongoDB service.

To use the MongoDB service in your application, complete the following steps:

    Manage MongoDB service instance by using the command line interface.
        Create a MongoDB service instance by typing the cf create-service command:

        $ cf create-service mongodb 100 mongodb01

        The cf create-service command creates a MongoDB service instance with a name of mongodb01 in your space. You can use the cf services command to list all available service instances that you created.
        Bind the service to your application by typing the cf bind-service command:

        $ cf bind-service AppName mongodb01

    Connect to the MongoDB service in your application.

    After you bind a MongoDB service instance to the application, the following configuration is added to your VCAP_SERVICES environment variable:

    { "mongodb-2.2": [ { "name": "mongodb-76b24", "credentials": { "hostname": "10.0.116.49", "host": "10.0.116.49", "port": 10001, "username": "be879069-b273-4656-b5fb-3daa5c508044", "password": "f268582e-0a52-42a8-9b97-66889a9cb662", "name": "76ea370c-8678-4c51-b3cf-a0cd722ed93a", "db": "db", "url": "mongodb://be879069-b273-4656-b5fb-3daa5c508044:f268582e-0a52-42a8-9b97-66889a9cb662@10.0.116.49:10001/db" } } ] }

    The configuration for the MongoDB service instance in the VCAP_SERVICES environment variable includes the following information:

    hostname
        The host name of the MongoDB server.
    host
        The IP address of the MongoDB server.
    port
        The port number of the MongoDB server.
    name
        The user name for authentication.
    password
        The password for authentication.
    db
        The database name.
    url
        The connection URL.

    To obtain the service credentials that are required to connect to the MongoDB instance, use the following code snippet:

    if (process.env.VCAP_SERVICES) { var env = JSON.parse(process.env.VCAP_SERVICES); var mongo = env['mongodb-2.2'][0].credentials; } else { var mongo = { "username" : "user1", "password" : "secret", "url" : "mongodb://user1:secret@localhost:27017/test" };

    The preceding code checks whether the VCAP_SERVICES environment variable exists. If the VCAP_SERVICES environment variable exists, the application uses the properties of the redis variable to access the database. If the VCAP_SERVICES environment variable does not exist, a local MongoDB service instance is used.
    Interact with the MongoDB service instance to put and get object.

    You can interact with the MongoDB service instance by using the service credentials; for example, you can read, write, or update the service instance. The following example shows how to write a string object to the MongoDB service instance:

    var create_message = function(req, res) { require('mongodb').connect(mongo.url, function(err, conn) { var collection = conn.collection('messages'); // create message record var parsedUrl = require('url').parse(req.url, true); var queryObject = parsedUrl.query; var name = (queryObject["name"] || 'megam'); var message = { 'message': 'Hello, ' + name, 'ts': new Date() }; collection.insert(message, {safe:true}, function(err){ if (err) { console.log(err.stack); } res.writeHead(200, {'Content-Type': 'text/plain'}); res.write(JSON.stringify(message)); res.end('\n'); }); }); }

    After you write a string object to the MongoDB service instance, you can retrieve JSON objects from the MongoDB service instance by using the following code snippet:

    var list_message = function(req, res) { require('mongodb').connect(mongo.url, function(err, conn) { var collection = conn.collection('messages'); // list messages collection.find({}, {limit:10, sort:[['_id', 'desc']]}, function(err, cursor) { cursor.toArray(function(err, items) { res.writeHead(200, {'Content-Type': 'text/plain'}); for (i=0; i < items.length; i++) { res.write(JSON.stringify(items[i]) + "\n"); } res.end(); }); }); }); }

    Push your application to megam\u2122.

    After you finish coding, you can deploy your application to the megam environment. To deploy an application, enter into the root directory of the application, and then type the following command:

    $ cf push

    Optional: Unbind or delete a MongoDB service instance.

    To unbind a service instance from an application, you can use the cf unbind-service command. To delete a service instance, use the cf delete-service command.

Binding MongoDB instances to Liberty applications

If you push a stand-alone application or a packaged Liberty server and you bind it to a MongoDB service instance, the Liberty buildpack automatically generates or updates the Mongo configuration in the server.xml file.
Binding MongoDB service instances to a stand-alone Liberty application
When you push a stand-alone application, the Liberty buildpack generates a server.xml file. If you bind your application to a MongoDB service instance, the Liberty buildpack also generates the following configuration elements in the server.xml file. The configuration elements are required to access the database.

    A mongo element.
    A mongoDB element.
    A library element with an embedded fileset element.
    A featureManager element. The Liberty buildpack adds the mongodb-2.0 feature to the featureManager element.
    An application element. The Liberty buildpack adds the classloader for the Mongo library to the application element.

In addition, the Liberty buildpack provides the required JAR files of the client driver.

In the mongoDB element, the Liberty buildpack generates a JNDI name that is used by your application to access the data source. Because the Liberty buildpack does not have access to the JNDI name that is used by the application, the Liberty buildpack generates a JNDI name with a convention of mongo/service_name, where service_name is the name of the bound service.

For example, if you bind a MongoDB service instance that is named mymongo to the application, the Liberty buildpack generates a JNDI name of mongo/mymongo. When you develop the application and create the MongoDB service instance, ensure that the JNDI name that is used by the application is the same as the JNDI name that is generated by the Liberty buildpack.

The following example shows the configuration that is generated when an application is pushed to megam and is bound to a MongoDB service instance that is named mymongo:

<featureManager> <feature>webProfile-6.0</feature> <feature>jaxrs-1.1</feature> <feature>mongodb-2.0</feature> </featureManager> <application context-root='/' location='../../../../../' name='myapp' type='war'> <classloader commonLibraryRef='mongo-library'> </application> <mongo id='mongo-mymongo' libraryRef='mongo-library' password='${cloud.services.mymongo.connection.password}' user='${cloud.services.mymongo.connection.user}'> <hostNames>${cloud.services.mymongo.connection.hosts}</hostNames> <ports>${cloud.services.mymongo.connection.ports}</ports> </mongo> <mongoDB databaseName='${cloud.services.mymongo.connection.db}' id='mongo-mymongo-db' jndiName='mongo/mymongo' mongoRef='mongo-mymongo'> <library id='mongo-library'> <fileset dir='${server.config.dir}/lib' id='mongo-fileset' includes='mongo-java-driver-2.11.3.jar'> </library>

Binding MongoDB instances to a packaged Liberty server or a Liberty server directory

When you push a packaged Liberty server to megam, the Liberty buildpack detects and uses the server.xml file in the compressed file that you provide. When you bind the packaged Liberty server to a MongoDB service instance, the Liberty buildpack checks the server.xml file for the mongo and mongoDB elements that correspond to the bound service instance:

    If the Liberty buildpack does not find the mongo and mongoDB elements, the two elements are created and added to the server.xml file.
    If the Liberty buildpack finds both mongo and mongoDB elements, the two elements are checked and updated as required to work in megam.
    If the Liberty buildpack finds only one of the elements, the configuration is invalid.

If you provide configuration in your server.xml file, the configuration must be coherent. The mongo, mongoDB, library, and fileset elements must be configured. The application or the webApplication element must contain the classloader that includes the library. In addition, your configuration elements must contain the IDs that are required to access the MongoDB service instance.
The Liberty buildpack searches for the existing configuration by using the IDs in the elements. The configuration elements in the server.xml file must use the following IDs. If the following IDs are not used, errors might occur.

    The mongo element must use a configuration ID of mongo-service_name.
    The mongoDB element must use a configuration ID of mongo-service_name.
    The library element must use a configuration ID of mongo-library.
    The fileset element must use a configuration ID of mongo-fileset.

If the Liberty buildpack finds existing configuration, it checks and updates the configuration if necessary. For example, the buildpack might update the following elements and attributes:

    The user and password attributes in the mongo element. The hostNames and ports subelements of the mongo element might also be updated.
    The databaseName attribute of the mongoDB element.
    The dir and includes attributes of the fileset element.

The Liberty buildpack does not update the jndiName attribute. The value of the jndiName attribute is independent of the service name.

You can provide your own client driver JAR files. The client driver JAR files must be placed in the usr/servers/servername/lib directory. If you do not provide client driver JAR files, the Liberty buildpack provides the files for you. The client driver JAR files that you provide must use the standard names that are established by the providing vendor. You cannot rename client JAR files.

The following example shows the Mongo configuration that is provided in the local server.xml file. This example assumes that when the packaged server is pushed to megam, it is bound to a MongoDB service instance named mymongo.

<mongo id="mongo-mymongo" libraryRef="mongo-library"> <hostNames>;localhost</hostNames> <ports>12707</ports> </mongo> <mongoDB id="mongo-mymongo-db" databaseName="test" jndiName="TestMongo" mongoRef="mongo-mymongo"> <library id="mongo-library"> <fileset id='mongo-fileset' dir='c:/mongoDB' includes='mongo-java-driver-2.11.3.jar'> </library>

When the server.xml file is pushed to megam, the Liberty buildpack updates the Mongo configuration elements:

<mongo id='mongo-mymongo' libraryRef='mongo-library' password='${cloud.services.mymongo.connection.password}' user='${cloud.services.mymongo.connection.user}'> <hostNames>${cloud.services.mymongo.connection.hosts}</hostNames> <ports>${cloud.services.mymongo.connection.ports}</ports> </mongo> <mongoDB databaseName='${cloud.services.mymongo.connection.db}' id='mongo-mymongo-db' jndiName='TestMongo' mongoRef='mongo-mymongo'/> <library id='mongo-library'> <fileset dir='${server.config.dir}/lib' id='mongo-fileset' includes='mongo-java-driver-2.11.3.jar'/> </library>









- :ref:`Backup Addon <backup_addon>`
