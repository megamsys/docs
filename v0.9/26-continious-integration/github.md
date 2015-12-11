---
title: "Github"
excerpt: "Obviously the most popular scm today"
---
[block:api-header]
{
  "type": "basic",
  "title": "GitHub is where great software is built."
}
[/block]
With more than 10 million people, GitHub is a community where developers can easily discover, reuse, and contribute to more than 24 million projects using an industry standard workflow.

It is really simple, all you need do it a 3-click app launch from megam oja and your continuous integration is activated. 

Now, when you commit code on github and make feature changes or bug fixes, it gets automatically updated on the production servers in no time. 

Megam Oja supports github, but you need to configure with the GitHub's OAuth credentials

#Ubuntu

##Environment variables

Register for [OAuth keys](https://github.com/settings/applications/new)

Update the file `/var/lib/megam/env.sh` with the client_id and secret_key 
[block:code]
{
  "codes": [
    {
      "code": "nano /var/lib/megam/env.sh\n\ninitctl set-env NIL_GIT_CLIENT_ID=dc161ea567cf79adb11f\ninitctl set-env NIL_GIT_SECRET_KEY=224f7fea52a22bd1bf8bda003492b17873f9b79c",
      "language": "text",
      "name": "Envs"
    }
  ]
}
[/block]
##Restart Nilavu
[block:code]
{
  "codes": [
    {
      "code": "stop megamnilavu\n\nstart megamnilavu",
      "language": "text"
    }
  ]
}
[/block]

[block:html]
{
  "html": "<a class=\"megam-button blue\" href=\"megam_app_java\" role=\"button\">Go to the launch app</a>\n<style>\n\n</style>"
}
[/block]