---
title: "Maintenance"
excerpt: "We found while running this setup, periodic backup of images and virtual machines were handy."
---
#Periodic snapshotting

As we have [remote backup](doc:megam_backup)  periodic backups of images, running vms is recommended and its a breeze to do.

This becomes handy to survive failures and restoring with ease.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/cKwi6nciTZSmW9Hi2Mqo",
        "recovery.png",
        "286",
        "286",
        "#5e6e76",
        ""
      ]
    }
  ]
}
[/block]
##Images

Here is the command. Let us first list all the images and running vms.
[block:code]
{
  "codes": [
    {
      "code": "rbd ls one",
      "language": "text",
      "name": "List all images and running vms"
    }
  ]
}
[/block]
Here we are exporting image #12 
[block:code]
{
  "codes": [
    {
      "code": "rbd export --pool=one one-12 megam.img\n\ntar -cvf megam.img megam.img.tar.gz",
      "language": "text",
      "name": "rbd  export image #12"
    }
  ]
}
[/block]
##Running VMs

Here we are exporting image #12 , vm #55

The vm #55 runs using the image #12
[block:code]
{
  "codes": [
    {
      "code": "rbd export --pool=one one-12-55 megam_vm55.img\n\ntar -cvf megam.img megam.img.tar.gz",
      "language": "text",
      "name": "rbd export image #12 vm #55"
    }
  ]
}
[/block]
When in indeed, transfer the image via sftp to the OpenNebula Frontend
[block:code]
{
  "codes": [
    {
      "code": "tar -xvf vm1.img.tar.gz",
      "language": "text",
      "name": "Untar"
    }
  ]
}
[/block]
Import it back into OpenNebula. 
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"http://docs.megam.io/docs/megam_ceph_usage\" role=\"button\" target=\"_blank\">Go to the ceph usage (advanced)</a>\n<style>\n\n</style>"
}
[/block]