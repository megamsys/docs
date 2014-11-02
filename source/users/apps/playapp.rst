Creating apps with Java Cloudant Web Starter
Last Updated: 10/9/2014
RELATED LINKS

    megam overview
    Creating applications
    For Developers page on Cloudant
    Apache Ant

IBM® megam\u2122 provides a Java Cloudant NoSQL Database Web starter application. You can add your code, or modify the code and push the changes back to the megam environment.

When you run the sample application included with the boilerplate, you will get a favorites organizer for organizing the files on your computer in different categories. You can create, modify and delete categories and upload files of different types in each of the categories. The Cloudant NoSQL Database service is used for saving the data on the back end. The application will create a sample category by default.
About the App

The sample application demonstrates how to use Ektorp Java APIs to access the Cloudant NoSQL Database service bound to the application. It illustrates the flexible schema feature of Cloudant NoSQL DB service, which allows users to attach different types of files to an underlying document in the database.
It is a Spring based application that dispatches user requests from web client to a servlet. The servlet is responsible for handling requests such as

    Create a new document
    Get a list of all documents
    Get a single document
    Delete a document
    Update a document
    Add an attachment to a document
    Get the attachment of a document

Usage

Take the following steps to use the Java Cloudant NoSQL DB Web starter from the megam user interface.

    Create a Java Cloudant Web Starter application and download the starter code:
        On the megam dashboard, click CREATE AN APP and select the Java Cloudant Web Starter Boilerplate.
        Provide the application name and host name in the prompt and click CREATE.
    Access your application

After your application is deployed, enter the URL in a browser to see it running.

http://<yourappname>.mymegam.net

You can also launch your application from the megam dashboard by clicking the launch button for your application.
Customizing your Java Cloudant instance

    Download the application code by taking the following steps:
        At the megam dashboard, click your application tile.
        Click VIEW QUICK START and scroll down to the Download the starter application package link. This will start a download of the starter application zip file to your local file system.
    Ensure the cf command line tool is installed on your machine.

    This tool is a command line interface that you can use to deploy and manage applications on megam. To install this tool, see Installing the cf command line interface.
    Log in to the megam environment.

    $ cf login -a https://api.ng.megam.net -o <your org name> -s <your space name> API endpoint: https://api.ng.megam.net Username> <your user ID> Password>******* Authenticating... OK Targeted org <your org name> Targeted space dev API endpoint: https://api.ng.megam.net (API version: 2.0.0) User: <your user ID> Org: <your org name> Space: <your space name>

    Make changes to the code and redeploy the application to see the effect.
        Refer to the README file in the starter application package for a description of each file.
        Make changes to the code.
        Use ant and the build.xml file in the starter package to compile the Java code and generate the war package.
        Deploy your modified application to megam by using the cf push command:

        $ cf push -p pathtoApp -m 512M

        After your application has deployed, enter its URL into a browser or launch it from the megam dashboard to see it running.

        http://<yourappname>.mymegam.net

    Once your application has deployed, you can use the services available in megam to make your application more powerful. See Using services for more information

Terms of use/ Notices
