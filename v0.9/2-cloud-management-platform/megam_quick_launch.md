---
title: "Meg CLI"
excerpt: "In order to get your app running, create a new app you can use a commandline"
---
[block:api-header]
{
  "type": "basic",
  "title": "Launch an app using command line"
}
[/block]
This is in **Beta** as the usual option is to launch using [Megam Oja' cockpit](doc:taking-megam-oja-to-a-spin)


We  will use the command line to launch an app quickly. 

## 2. Setup Meg

Use curl command to set up the `meg`  cli.
[block:code]
{
  "codes": [
    {
      "code": "\\curl -s http://get.megam.io/meg/meg.sh | bash",
      "language": "shell"
    }
  ]
}
[/block]
## 3. Clone the below  gist
[block:embed]
{
  "html": "<pre><code>#\ntosca_definitions_version: tosca_simple_yaml_1_0\n\ndescription: Template for deploying a Spring app on console.megam.io(visit docs.megam.io)\nnode_templates:\n\n spring:\n  type: tosca.app.java\n  properties:\n    # omitted here for sake of brevity\n  requirements:\n    - domain: megambox.com\n    - source: https://github.com/megamsys/spring-mvc-fulfillment-base.git\n    - sshkey: samplekey</code></pre>",
  "url": "https://gist.github.com/morpheyesh/9256764912266a95c842",
  "title": "Launch Spring MVC(Java app) using an yaml file through Megam CLI on console.megam.io",
  "favicon": "https://assets-cdn.github.com/favicon.ico",
  "image": "https://avatars3.githubusercontent.com/u/4692223?v=3&s=400"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "$ git clone https://gist.github.com/morpheyesh/9256764912266a95c842 firstapp\n\n$ cd firstapp",
      "language": "shell"
    }
  ]
}
[/block]
## 4. Create an account
[block:code]
{
  "codes": [
    {
      "code": "$ ls\n\n$ meg account --create myemail@megam.co\n",
      "language": "shell"
    }
  ]
}
[/block]
## 5. Launch the app
[block:code]
{
  "codes": [
    {
      "code": "\n$ cd firstapp\n\n$ meg csar --create megamjava.yaml\n",
      "language": "shell"
    }
  ]
}
[/block]
## 6.Now list your pushed YAML file to get the CSAR ID which we will use to launch
[block:code]
{
  "codes": [
    {
      "code": "meg csar --list",
      "language": "shell"
    }
  ]
}
[/block]
## 7. Copy the CSAR ID and spin off your first app
[block:code]
{
  "codes": [
    {
      "code": "meg csar --push CSR00000000000000000",
      "language": "shell"
    }
  ]
}
[/block]
Voila ! Your App is launched.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/hgAYUB9NSgiJUnWpWZ65",
        "megam_launch.png",
        "287",
        "286",
        "#5c6c74",
        ""
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "* Your code gets automatically integrated in the cloud.\n* Just type the http://your_app_url in the browser.",
  "title": "App is launched."
}
[/block]
Now that you have quickly launched your app, you might want to launch an app using the browser 
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"megam_app_java\" role=\"button\" target=\"_blank\">Go to the apps</a><style></style>"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "We hang around in our [public hipchat room](http://j.mp/megamchat).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
  "title": "Any questions? We're always here to help"
}
[/block]