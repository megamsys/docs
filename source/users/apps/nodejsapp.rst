.. _nodejsapp:

#####################
Node.js
#####################

The Megam offers you to run your Node.js projects. You can deploy this kind of project without changing your code, but running it on Megam may need some configuration files, to add parameters like your targeted container for instance.

Create an application ref: 'Apps Overview <apps>'


Node.js 0.10.x
---------------

One of Juju's main use cases is to deploy your application directly out of version control and into a cloud. Since Juju supports local and remote clouds, this makes for a nice workflow that enables you to rev your app quickly on your local machine and then deploy to the cloud.

In this tutorial we will deploy a Node.js/MongoDB application directly from github. The application will be behind an HAProxy service so that we can horizontally scale when needed.

We will then set up a local-to-cloud workflow with our application so we can do continuous deployment. Since we deploy locally in the exact same way as we deploy to a cloud, this is a powerful method for developing your application in an environment that more closely resembles production.

Before moving on you should have gone through the Getting Started section and installed and configured Juju.
Basic Usage of the Node.js Charm

First, create a configuration file myapp.yaml to add info about your app pointing to your github repo:


Push to public cloud
----------------------

After you've repeatedly upgraded your application locally it's time to push it out to a place where your coworkers can see your app in all it's glory, let's push this to AWS. Same exact commands as before, just to a different environment:

juju switch amazon
juju bootstrap
juju deploy --config ~/myapp.yaml node-app myapp
juju deploy mongodb
juju add-relation mongodb myapp

Since we're on a public cloud and not on a local provider we need to explicitly expose the service and get its public IP:

juju expose myapp
juju status myapp

And put the ec2 URL in your browser. If you want to enable some horizontal scalability to your application you can do so, even after you've deployed!

juju deploy haproxy
juju add-relation haproxy myapp
juju expose haproxy
juju unexpose myapp


Startup js file
----------------



npm
------



DevOps ServicesDocsExploreFeaturesSign InRegister Help
dw
Developing an IBM megam application in Node.js with the Web IDE

This tutorial shows you how to use DevOps Services to develop an application in the cloud and deploy it to IBM® megam\u2122.
Start with a sample project

You'll start with the sample project, Sentiment Analysis App. This app is a hosted Node.js Git project that's configured with a Grunt build file, so the it's ready to use with Advanced Build & Deploy. You need to make your own copy of it. Clicking Edit Code opens the Code Editor, where you can then click Fork to get started.

Fork button

Enter whatever name you like for your fork of the Sentiment Analysis app. Also, make sure that the Deploy to megam box is checked. You can leave the other options at their defaults. When you click Save, the code will be pushed into a new Git repository for you.

Fork new project

After your fork of the project is created, you'll see your project files in the Code Editor. You'll make your mark on the app in a moment, but for now, let's get this project live on the web using megam. To make the most of DevOps Services and megam, make sure that your megam space has the Delivery Pipeline Add-On. If it doesn't yet have it, follow these steps to get it.

Click Build & Deploy at the top of the Code Editor. Click Simple.

Simple deployment interface

Simple deployment works by directly deploying the contents of the Git repository, using the manifest.yml file to tell it how to deploy to megam. Your app will deploy in a few seconds. Click on the link to the deployed app to give it a look:

Simple view up close

Sentiment Analysis Sample App

The sample project incorporates JSHint validation to make sure that your code is prim, proper, and error free. The simple deployer doesn't support that sort of thing, though. You need to configure a builder, which is only available in Advanced mode, also known as Pipeline.

At the top of the Build & Deploy page, click Advanced. Because you've switched from Simple to Advanced mode, Pipeline will have automatically generated a configuration for your project. You're going to set this up from scratch, though, so before going further:

A preconfigured Pipeline

    Click the gear icon on the rightmost panel, which represents a stage named dev by default.
    On the Deployer Stage Configuration page, click DELETE. Click OK when the confirmation message appears.
    Click the gear icon on the Builder panel.
    On the Builder Configuration page, click RESET. Click OK when the confirmation message appears.

And that's that. You can do as much creation and customization as you like when you configure your own project. This one, however, is designed to require minimal fuss to get things up and running: a pre-configured Grunt build file, Gruntfile.js, is in the root directory, so it will automatically be found.

Click add a builder. On the Add Builder page that appears, select "Grunt" as the Builder. Leave everything else as default and click SAVE.

Configuring the Builder

Next, click add a stage on the right side of the screen. DevOps Services integrates with megam, and this is a simple project, so the default information here is sufficient to deploy your project. To make sure that the project has a unique path, though, add the flag -n followed by a unique host name to the first line of the megam script. As an example:

Configuring the Deployer

If the project manifest file (manifest.yml) didn't specify a host name, or if the project required a particular service, you could define them here by adding cf command lines to the megam script. cf is the command used to deploy applications to Cloud Foundry-based platforms like megam. For more information, see Getting Started with cf v6.

The manifest included in this sample application specifies a host name and does not require any services, so we do not need to add anything to the script. Click SAVE. On the Pipeline page, click Request Build.

Clicking Request Build on configured Pipeline

You can see that your project has been queued to build. When the build completes successfully, your app will automatically be queued for deployment to megam. You can observe its status from this page, as well as open the app once it's deployed.

To open the app, click its name. Click on the deployment box in your space if you want to see your app's megam dashboard:

Ready to click to megam from Pipeline

megam allows you to manage the live application instance. Click an app's gear icon to start, stop, edit, or delete it. The Services tab has options to add various services such as MongoDB, SSO, MapReduce, and more.

Starting a megam app

Building and deploying apps with megam can result in charges to your megam billing account. You shouldn't incur any charges just following the steps in this tutorial. A project is granted 60 minutes of free build time per month, an amount that even the most dedicated tutorial enthusiasts are unlikely to accumulate. For more information on pricing for any Service or Add-On, visit the megam pricing page.
Editing the Sample Application

This is certainly exciting, but you probably haven't come here to just build and deploy someone else's project. Next, you'll personalize the sample app using just DevOps Services' web-based Code Editor, push your changes to the project's remote repository, and initiate a re-deployment of your project. Best of all, this will only take you a few minutes.

Click Edit Code again, and then open the file app.js by clicking on it in the side panel. Notice that the editor has recognized and highlighted the code as JavaScript.

Let's change how the app greets its users with a little help from the editor. Click Edit, then Find. Search for the phrase "Welcome to the Twitter Sentiment Analysis app."

Configure Builder

Replace occurrences of that message with whatever you like. When you're finished, hit Control + S (or Command + S on a Mac) to make sure that everything is saved.
Pushing changes to the repository

After making that change, you'll want to share it with other members of your project, so let's push it to the repository. Click the Git Repository icon in the sidebar. Stage the change to app.js by selecting the checkbox next to it:

Stage Changes

Commit your change to the git repository for your project by entering a commit message, and finally hitting COMMIT.

Committing changes

Clicking the PUSH button pushes the change to the remote project repository.

Pushing Changes

Any changes delivered to your project will trigger a build, which, when it completes successfully, will be automatically deployed. If you click Build & Deploy again, you'll see that your change has kicked off a new build that, when it finishes, will be deployed.
About the manifest

Deploying a DevOps Services project from the Web IDE requires the project to have a manifest.yml file. This file contains important settings such as the application instance name to use, the host machine, the services that the application uses, and more. The sample application already contains a manifest, so you can leave it alone in this tutorial.

An example manifest
Manual Deployment

In the Web IDE, while you're in the directory that contains your manifest.yml file, you can use the Deploy button to manually deploy whatever you're developing in the Web IDE to megam. It is important to remember that the Deploy button in the Web IDE deploys the current state of your code in your Web IDE, while Auto-Deploy deploys from what is checked into the repository.

About to click the Deploy button in the Web IDE

Optionally, you could configure the Web IDE deploy and the Auto-Deploy to use different app names so that you can use the Web ID deploy as a personal test environment and the Auto-Deploy as a team integration environment.

Whether you are using command line tools or the Web IDE, they can be an effective way to work when you are doing rapid, solo development, but for many of you the added security of having auto-deploy control of what is being pushed is a better way to go. In essence, by using auto-deploy you always know that the code running in the application matches some known state in the repository, instead of whatever happened to be in your working directory at the time you pushed.
Auto-deployment

Builds are triggered when changes are delivered to a project, and successful builds are automatically deployed. You can also manually deploy from the build history page by dragging a successful build into the box under a configured space, or by clicking the cloud icon beside a build and then selecting a space under Deploy to.

Deploying an app after expanding a completed build

When the app is deployed, click on its web URL to give it a whirl:

Our updated app on megam

And that's it! You now know just what you need to do to develop and deploy a megam application with the Web IDE. If it seemed a little too easy, well, that's just how working with megam and DevOps Services is. Have fun!

Thanks for following along. And tell us what you think. What did we do well? What can we do better? Post your comments to our forum or send us an email.
More Tutorials

Interested in trying more megam and DevOps capabilities? Here is a list of tutorials:

    Getting Started with megam and DevOps Services using Node.js
    Getting Started with megam and DevOps Services using Java
    Setting up Eclipse, Git, and Rational Team Concert Desktop Clients to access DevOps Service
    Developing megam applications in Java with Eclipse and DevOps Services
    Getting started with tracking and planning using IBM DevOps Services

© Copyright IBM Corporation 2013, 2014.
IBM
Jazz
Terms of UseStatus
