.. _railsapp:

#####################
Rails
#####################


The Megam offers you to run your Rails projects. You can deploy this kind of project without changing your code, but running it on Megam may need some configuration files, to add parameters like your targeted container for instance.

Create an application ref: 'Apps Overview <apps>'


Rails 4.x
------------

One of Juju's main use cases is to deploy your application directly out of version control and into a cloud. Since Juju supports local and remote clouds, this makes for a nice workflow that enables you to rev your app quickly on your local machine and then deploy out the cloud.

In this HowTo we will deploy a Rails/PostgreSQL application directly from github. The application will be behind an HAProxy service so that we can horizontally scale when needed.

We will then set up a local-to-cloud workflow with our application so we can do continuous deployment. Since we deploy locally in the exact same way as we deploy to a cloud, this is a powerful method for developing your application in an environment that more closely resembles production.

Before moving on you should have gone through the Getting Started section and installed and configured Juju.
Basic Usage of the Ruby on Rails Charm

Create a YAML config file with your application's name and its git location

sample-app.yaml

sample-app:
  repo: https://github.com/pavelpachkovskij/sample-rails

Deploy the application and a proxy:

juju deploy --config sample-app.yaml rails myapp
juju deploy haproxy
juju add-relation haproxy myapp

Deploy and relate database:

juju deploy postgresql
juju add-relation postgresql:db myapp

Now you can run migrations:

juju ssh myapp/0 run rake db:migrate

Seed database

juju ssh myapp/0 run rake db:seed



Ruby 2.1.x
------------




Bundler
--------

Creating apps with Ruby on Rails
Last Updated: 10/9/2014
RELATED LINKS

    Heroku buildpack: Ruby
    Ruby on Rails documentation
    Cloud Foundry CLI
    IBM megam Pricing Sheet
    IBM megam Prerequisites

IBM® megam\u2122 provides a Ruby on Rails starter application as a template so that you can add your code and push the changes back to the megam environment. The Ruby on Rails runtime environment is the container for this type of applications.
About the Ruby on Rails starter application

This Ruby on Rails starter application is a boilerplate for megam Ruby on Rails web application development.

It displays the current system environment variables and demonstrates how to develop and deploy a Ruby on Rails web application for megam.
Usage
Use the following steps to start using the Ruby on Rails starter application from the megam user interface:

    Create a Ruby on Rails starter application and download the starter code.
        Click Create App to deploy a Ruby on Rails starter application.
        Provide the App name and Host in the prompt.
        After the application deploys, click the View Quick Start button.
        Download the starter application package.
    Ensure that the cf command line tool is installed.

    This tool is a command line interface for application deployment and management on megam.
    Log in to the megam environment.

    $ cf login -a https://api.ng.megam.net -o <your org name> -s <your space name> API endpoint: https://api.ng.megam.net Username> <your user ID> Password>******* Authenticating... OK Targeted org <your org name> Targeted space dev API endpoint: https://api.ng.megam.net (API version: 2.0.0) User: <your user ID> Org: <your org name> Space: <your space name>

    Modify the application and deploy again.

    In the starter application package, a README file describes each file. Make changes to the code, deploy the application again, then see the effect.

    To deploy your modified application to megam, use the cf command. For example:

    $ cf push <yourappname> -p pathtoApp -m 512M

    Access your application.

    After your application is deployed, open the URL in a browser to see it running.

    http://<yourappname>.mymegam.net

    Start using services.

    There are many services available in megam to make your application more powerful. You can add any available services to your application. See each service document for more information.

Terms of use/ Notices
