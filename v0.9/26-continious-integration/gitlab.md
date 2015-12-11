---
title: "Gitlab"
excerpt: "For private Git, this is it."
---
[block:api-header]
{
  "type": "basic",
  "title": "Private git repository"
}
[/block]
Private git repository as provided by gitlab and updated in our [repo](http://get.megam.io). Install gitlab package if you wish to setup on premise continuous integration based on a git repository.

Megam Oja supports gitlab, but you need to configure with the Gitlab's credentials

## Ubuntu
[block:code]
{
  "codes": [
    {
      "code": "sudo apt-get install gitlab",
      "language": "shell"
    }
  ]
}
[/block]
##Configure  Nilavu

Update the file `/var/lib/megam/nilavu.yml` with the gitlab endpoint
[block:code]
{
  "codes": [
    {
      "code": "nano /var/lib/megam/nilavu.yml\n\n# /var/lib/megam/nilavu.yml\ndefaults: &defaults\n\n# gitlab endpoint\n  gitlab: http://<ip>/v2",
      "language": "yaml",
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