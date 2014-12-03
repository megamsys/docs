If you can't find a starter in the IBM® megam\u2122 catalog that provides the runtime that you want, you can bring an existing buildpack to megam. You can specify a custom, Cloud Foundry-compatible buildpack when you deploy your application by using the cf push command.
External buildpacks are provided by the Cloud Foundry community for you to use as your own buildpacks.
Note: External buildpacks are not supported by IBM; therefore, you might need to contact the Cloud Foundry community for support.

Before you deploy your application to megam, make sure that you install the cf command line interface.

Built-in community buildpacks
    In megam, you can also use built-in buildpacks that are provided by the Cloud Foundry community. To list built-in community buildpacks run the cf buildpacks command:

    $ cf buildpacks Getting buildpacks... buildpack position enabled locked filename ... java_buildpack 7 true false buildpack_java_v2.0.2.zip ruby_buildpack 8 true false buildpack_ruby_v46-245-g2fc4ad8.zip nodejs_buildpack 9 true false buildpack_nodejs_v8-177-g2b0a5cf.zip

    For the same runtime or framework, IBM created buildpacks take precedence over the community ones. If you want to use the community buildpack to overwrite the IBM created buildpack, you must specify the buildpack by using the -b option with the cf push command. For example, you can use the community buildpack for Java\u2122 web applications:

    $ cf push app_name -b java_buildpack

    You can also use the community buildpack for Node.js applications:

    $ cf push app_name -b nodejs_buildpack

    For a runtime or framework that is not supported by IBM-created buildpacks but is supported by built-in community buildpacks, you do not have to use the -b option with the cf push command. However, you can still use the external buildpacks with the -b option. For example, for Ruby applications, there are no IBM-created buildpacks. You can use the built-in community buildpack:

    $ cf push app_name

    Or, you can also use an external buildpack for Ruby applications:

    $ cf push app_name -b https://github.com/cloudfoundry/heroku-buildpack-ruby

External buildpacks

    To use external buildpacks, you must specify the URL of the buildpack with the -b option on the cf push command. For example, to use an open source PHP buildpack provided by the Cloud Foundry community, run the following command:

    $ cf push app_name -b https://github.com/dmikusa-pivotal/cf-php-build-pack

    Restriction: External buildpacks are not supported by IBM; therefore, you might need to contact the Cloud Foundry community for support.

Take the following steps to deploy your application with a custom buildpack:

    On the cf command line interface, issue the following command to log in to megam. For organization_name and space_name, you can use the default organization and space that megam provides you. The name of the default organization is the same as your user name, and the name of the default space is dev.

    $ cf login -a api.ng.megam.net -u <your user ID> -p password -o <your org name> -s <your space name>

    Issue the following command with the -b option to deploy your application with your own buildpack, in which buildpack_URL is the URL of the buildpack:

    $ cf push app_name -b buildpack_URL

For example, you might want to use an open source PHP buildpack that is provided by the Cloud Foundry community. When you deploy your PHP application to megam, issue the following command to specify the Git repository URL of the buildpack:

$ cf push app_name -b https://github.com/dmikusa-pivotal/cf-php-build-pack

Terms of use/ Notices
