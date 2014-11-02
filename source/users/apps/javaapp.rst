.. _javaapp:

#####################
Java
#####################


Java

The Megam offers you to run your Java projects. You can deploy this kind of project without changing your code, but running it on Megamneeds some configuration files, to add parameters like your targeted container for instance.


Create an application ref: 'Apps Overview <apps>'



Tomcat 8.0
------------



JVM Runtime
------------




Maven
------

Maven is essentially a project management and comprehension tool and as such provides a way to help with managing:




DevOps ServicesDocsExploreFeaturesSign InRegister Help
dw
Getting Started with IBM megam and DevOps Services using Java
Create an application with IBM megam

IBM® megam™ is an open-standards, cloud-based platform for building, managing and running apps of all types (web, mobile, big data, new smart devices). Capabilities include Java™, mobile backend development, application monitoring, as well as capabilities from ecosystem partners and open source, all through an as-a-service model in the cloud.

If you haven't registered already, you'll need to do so at the megam home page. Just click Sign up for free to get set up.

Sign up for a free

Once you've registered, there is lots of helpful information available on the megam site, such as ...

    Getting Started with IBM megam
    IBM megam Overview

... but if you prefer to try things rather than read about them, just follow along. You can have a sample application up and running in minutes.

You can start by signing in to megam, which takes you to the Dashboard:

megam Dashboard

The dashboard gives you an overview of the active megam space for your organization. By default, the space is dev and the organization is the project creator's username. For example, if sara@example.com logs in to megam for the first time, Sara's active space is dev and her organization is sara@example.com.

If you create additional organizations or spaces in megam, remember to use the same ones as you follow our tutorials. If you stick to the default selections, you should be just fine.

Clicking CREATE AN APP lets you choose different kinds of Runtimes (like Java or Ruby), Services (such as DataCache or Mongo) and Boilerplates, which are essentially pre-configured application templates that are great ways to get started. Select the Java Web Cache Starter Boilerplate, which opens a panel that displays more information about what it does:

megam Java Web Starter

As you can see, the application is a simple Java Web server that includes some example code that demonstrates the IBM DataCache and Monitoring and Analytics services. Let's try it!

At this point, you're just a few clicks away from having a running application.

In the Create an app panel, enter a Name for your app. Enter a different host if megam indicates that a host route is taken (or if you just want a host that's different from the app name). Leave the Space field as it is. megam Create App dialog

The Name is a simple name you can use to find this application the next time you come back to the megam dashboard. Host partially defines the URL (the rest comes from megam itself) that lets you access your new app from the Internet. As you probably guessed, this URL must be unique, since the URL space is shared among all users. In Selected Plans, leave Liberty for Java™ as Default, and Datacache and Monitoring and Analytics as Free.

That's all there is to it! You'll be taken to your app's overview page. It takes a short while for the application to start up, but once it does, click on your app's route to see it running:

A running web application

It's great that the application is running, but it's not very interesting if you don't have a way to publish updates to it.

There are lots of ways you can work with your application code, but one of the slickest is to use something called auto-deploy. With auto-deploy, you can modify the code that is running in your app by simply pushing the changes to a Git repository. The mechanism that implements auto-deploy is provided by the IBM DevOps Services powered by JazzHub Build & Deploy support, but more about that later.

To enable automatic deployment, click ADD GIT on your app's overview page. With this, you get a Git repo that's populated with the code from the sample Java app.

Add Git

You may be asked to enter your password because DevOps Services must verify that it can act on your behalf, so enter your IBM id password and click Sign In.

DevOps Services sign in page

Note: The first time you access DevOps Services, you might need to create a "Jazz™ ID" and link it to your IBM id. A Jazz ID is a kind of "short name" that is used in several places, including the URL for the repository that is about to be created for you. Just follow the instructions in the dialog. You'll only ever see it once.

Make sure the box to populate the Git repo with the starter application package and automatically deploy the app is checked.

Create Git repo dialog

Success! You've created a Git repo, loaded it with the example code, and deployed the app, all in a few clicks.

Git repo success message dialog

There's just one more thing to do before moving on to DevOps Services: you need to enable the Delivery Pipeline Add-On in megam. This will allow you to experience some of the fancier automated build and deployment capabilities later on. To do so:

    Click CONNECT AN ADD-ON from your new app's overview.
    Choose Delivery Pipeline in the DevOps category.
    Don't worry about Space or App. Just click CREATE.

The Delivery Pipeline Add-On will be added to your megam space, ready to spring into action as you need it later.

What if you want to see the app's code, now, or configure how it deploys? You'll need IBM DevOps Services for that. Return to the dashboard, click on your app's panel to open its overview, and then click EDIT CODE.

CODE button
DevOps Services

Your new project opens in the DevOps Services Web IDE. When you clicked "Add Git Integration" in megam, you chose to populate a new Git repository with the code that's now in front of you. There is lots of useful information on this page, which you can peruse later, but, for now, let's see how the code you have here is pushed out to megam. Click the BUILD & DEPLOY button.

Web IDE

Clicking that button opens a page that lets you configure and see the project's deployment status.

You'll arrive at the Simple page. With this deployment option, the contents of the Git repository are deployed directly to megam. There is no intermediate build step.

A deployment of your sample app has already started. Once it's up, it's available at the URL linked after Deploy to, while you can click the app name to view its overview on megam.

DevOps Services auto deploy page

You might be wondering how we're deploying a Java application directly from source, and well, we're not: this project is designed to help you get a sample application running on megam as quickly as possible, after all. The app has already been compiled, and the sample .war file is in the root directory.

Once you change things, you'll need to build the app again, and the Simple deployer doesn't do that. It's time to change the switch to Advanced. Click it!
Configuring Advanced Build & Deploy

When you switch from Simple to Advanced mode, Pipeline automatically generates a configuration for your project. You're going to set this up from scratch, though, so before going further:

A preconfigured Pipeline

    Click the gear icon on the rightmost panel, which represents a stage named dev by default.
    On the Deployer Stage Configuration page, click DELETE. Click OK when the confirmation message appears.
    Click the gear icon on the Builder panel.
    On the Builder Configuration page, click RESET. Click OK when the confirmation message appears.

With the Advanced option, also known as Pipeline, you can configure a builder to compile and package your application using a build script, and you can configure a deployer to deploy the application to megam with any additional options needed.

Unconfigured Advanced Build & Deploy page

First, let's configure the builder. Click add a builder. The Add Builder configuration page will open.

Configuring the Builder

The default settings will work for this project: build using Ant and pull from the master branch of your git repo. The builder will find build.xml in the root directory and run it during the build. The files that are needed for deployment are output into the build archive directory. It defaults to the same directory as the build script path, so there's no need to change that, either. Additionally, with automatic building enabled, changes delivered to the selected Git branch will trigger new builds.

Click Save. In a moment, the Pipeline page will refresh with information on your newly configured builder.

A configured Builder panel

Give it a try: click REQUEST BUILD. In a moment, you should have a successful build on your hands.

A configured Builder panel with a successful build

But what to do with it? Get it on the web with megam, of course! Click add a stage.

Configuring the Deployer with the Add Deployer Stage screen

Here, you can configure deployments to megam. You can give the app a name; by default, this comes from the manifest file, manifest.yml, which tells megam how to deploy your application. Let's leave it blank so that it will use the name in the manifest.

Leave the organization as it is. You can choose an existing space to use, or create a new one. Here, leave it as dev.

The script section shows the deployment script that will be executed to deploy the application. The CF_APP variable resolves to the app name. In this case, it will resolve to the name in the manifest, as we did not enter anything into the Application name field. Click SAVE.

Fully configured Pipeline

And that's as much configuration as you need to do. Next, your app is ready to be pushed out onto megam.

Remember the build you requested a few moments ago? Drop it onto the stage you just configured.

Dropping to deploy

This kicks off deployment. In seconds, your app will be on megam. Fast, right? And with the Pipeline configured, future successful builds of your app will be automatically deployed.

A deployed app using fully configured Pipeline

You can click on your app's name to visit it on the web; click next to it in the dev deployment box to look at your app's megam dashboard.

For this tutorial, you only configure a single deployment stage, but if you want more stages (maybe you want separate instances for testing and production, for example) you'll enjoy DevOps Services' multistage deployment capability. To learn more, watch this short video:

Building and deploying apps with megam can result in charges to your megam billing account. You shouldn't incur any charges just following the steps in this tutorial. A project is granted 60 minutes of free build time per month, an amount that even the most dedicated tutorial enthusiasts are unlikely to accumulate. For more information on pricing for any Service or Add-On, visit the megam pricing page.
Push changes to the Git repository by using the command line

You now have a Git repo with example code. Lots of tools can be used to work with Git, including all of the major desktop IDEs and even directly from the web using the Web IDE, but for now, let's just use the command line Git support.

Note: If you don't have Git, you can find information on installing it at Setting up Eclipse, Git, and Rational Team Concert Desktop Clients for use with DevOps Service. If you want to learn more about working with Git, you can browse the Git documentation pages.

First, clone the repo using the URL, which you can find on the megam application's dashboard or the DevOps project's overview:

$ git clone https://hub.jazz.net/git/jazzhubdemouser/YourApp-2014
Cloning into 'YourApp-2014'...
Username for 'https://hub.jazz.net': jazzhubdemouser
Password for 'https://jazzhubdemouser@hub.jazz.net':
remote: Counting objects: 49, done
remote: Finding sources: 100% (49/49)
remote: Total 49 (delta 0), reused 49 (delta 0)
Unpacking objects: 100% (49/49), done.
Checking connectivity... done.

Next, let's change your app source code and see what happens. In the WebContent folder there's a file called index.html. This contains some of what you see when you view your app on the web. Change some text in the body of the HTML there with whatever tool you like. If you just want to see a quick change, search for the title text, Welcome to my very own <span class="blue">Java Web Starter</span> on megam!, and change a word or two. When you're done, change to your project directory and git stage, git commit, and git push, like so:

$ cd /project_directory
$ git stage Webcontent/index.html
$ git commit -M "Sample app headline change"
[master 2336018] Sample app headline change
1 file changed, 1 insertion(+), 1 deletion(-)


$ git push
Username for 'https://hub.jazz.net': jazzhubdemouser
Password for 'https://jazzhubdemouser@hub.jazz.net':
Counting objects: 8, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 382 bytes | 0 bytes/s, done.
Total 4 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3)
remote: Processing changes: refs: 1, done
To https://hub.jazz.net/git/jazzhubdemouser/YourApp-2014
    ab4aaad..2336018 master -> master

Now, this is where it starts to get interesting! If you go back to the Build & Deploy page, you might notice that a new build has been requested. It was automatically triggered by the changes you delivered to the project repository. When it's finished, it will be deployed to megam. Once it's there, you can view your updated app on the web. Refresh your browser to ensure the updated page is displayed.

Application page showing new title

There you go! Now you can continue to make modifications to the example and push them to the Git repository as often as needed. And as the scope of the work grows, and more people are added to the project to work on it, everyone can push changes to the repository. Standard repository operations and build and deploy are all that is required to ensure that the right bits are always running.

If you want to configure desktop clients to work with your git repository, check out Setting up Eclipse, Git, and Rational Team Concert Desktop Clients for use with DevOps Service later.
Back to DevOps Services

In addition to build and deploy, DevOps Services provides a lot of other capabilities that are useful for application development:

    Hosting for public projects
    Multiple source code repositories
    Support for teams doing Agile development
    Web based development tools with customizations specifically for working with megam
    and lots more coming...

If you want to know more about DevOps Services, you can start by checking out the information here, but just as you did with megam, let's do something.

So far you've used command line tools to modify your code and push it to the repository, and you've seen that this works just fine. However, there is another way you can work with DevOps Services.

If you go back to the deployment page, you can see a button labeled EDIT CODE. Clicking this button, takes you to a complete online integrated development environment (IDE), based on the work of the Orion open source project. Here's what it looks like when you open the example project:

Orion at DevOps Services

From this environment, you can edit files with syntax coloring support for multiple languages including HTML, CSS, Java, JavaScript, Ruby, Python and more. For some languages, such as JavaScript and CSS, the IDE also supports syntax checking and content assist, both for standard language constructs and for the services provided by megam. To use Content Assist, just press Ctrl + Space. For example, here's what it looks like providing code completion for the standard node.js express module:

Orion showing express completions

Tip: While outside of the code editor, type Shift + ? to search through the various key bindings in the IDE. Type Shift + Alt + ? to do so while you're in the editor.

Just to round out the process, let's make one more modification to your application using the Web IDE. Before you do that, though, you must fetch and merge the app title change that you just made with the command line so that it shows in the Web IDE. You do that with the Git page. Open it.

Orion git status menu

From the Git page, fetch and then merge the change to your app.

Fetching and merging the change

Next, navigate through the directory tree until you get to the same file you worked on before (for example, WebContent/index.html), then simply edit in place.

Orion editing index

You can then use the integrated Git support to push the change. Head back to the Git page.

Orion git status menu

Then, stage the change by checking the box next to it:

Orion git staging

Enter a commit message and then hit Commit:

Orion git commit

And Push the change to the master branch on the origin remote:

Orion git push

It's just like you did with the command line, only with a few more clicks and a lot less typing. And now that you've done that, you can again see that your app was updated (refresh your browser to view the changes).

Our really cool app
Manual Deployment

In the Web IDE, while you're in the directory that contains your manifest.yml file, you can use the Deploy button to manually deploy whatever you are developing in the Web IDE to megam. It is important to remember that the Deploy button in the Web IDE deploys the current state of your code in your Web IDE, while Auto-Deploy deploys from what is checked into the repository.

About to click the Deploy button in the Web IDE

Optionally, you could configure the Web IDE deploy and the Auto-Deploy to use different app names so that you can use the Web ID deploy as a personal test environment and the Auto-Deploy as a team integration environment.

Whether you are using command line tools or the Web IDE, they can be an effective way to work when you are doing rapid, solo development, but for many of you the added security of having auto-deploy control of what is being pushed is a better way to go. In essence, by using auto-deploy you always know that the code running in the application matches some known state in the repository, instead of whatever happened to be in your working directory at the time you pushed.
A Final Note

You just saw how easy it is to create a Java web app at megam and run that app. With a few clicks, you created a Git repo, loaded it with the example code, and automatically deployed the app. In minutes, you changed code and pushed it using the Git command line and the Web IDE, automatically ran a build and deploy, checked the status of the app deployment, and ran the app to show your changes. That's all there is to it.

For those of you who made it this far, we hope this tutorial has given you a feel for how to get started with megam and DevOps Services using Java. Lots of details were glossed over, but the documentation links at the start can fill those in.

Thanks for following along. And tell us what you think. What did we do well? What can we do better? Post your comments to our forum or send us an email.
Next Steps

If you want to learn more about configuring Eclipse or other desktop clients to work with your git repository, see Setting up Eclipse, Git, and Rational Team Concert Desktop Clients for use with DevOps Service.

If you want to learn about how to integrate unit testing into your DevOps Services projects, see Developing megam applications in Java with Eclipse and DevOps Services.
More Tutorials

Interested in trying more megam and DevOps capabilities? Here is a list of tutorials:

    Getting Started with megam and DevOps Services using Node.js
    Setting up Eclipse, Git, and Rational Team Concert Desktop Clients to access DevOps Services
    Developing megam applications in Node.js with the DevOps Services Web IDE
    Developing megam applications in Java with Eclipse and DevOps Services
    Getting started with tracking and planning using IBM DevOps Services

© Copyright IBM Corporation 2013, 2014.
IBM
Jazz
Terms of UseStatus
