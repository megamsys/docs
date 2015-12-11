---
title: "Completing BeeBox"
excerpt: "In order to complete BeeBox, you'll need to setup Compute/Storage"
---
#Add a new compute/storage node

* [Megdc](doc:megam_megdc_tool) is ready

##Install ceph with 3 osds

We need at-least 2 individual HDDs.

In our case we use 3 HDDs mounted at `/storage1`, `/storage2`, `/storage3`
[block:code]
{
  "codes": [
    {
      "code": "megdc cephinstall --osd osd1=/storage1 --osd osd2=/storage2 --osd osd3=/storage3",
      "language": "shell"
    }
  ]
}
[/block]
Now that your ceph is ready, lets connect a datastore and have OpenNebula manage the same.

##Ceph status

Quicky check the ceph status, great we see as *HEALTH_OK*
[block:code]
{
  "codes": [
    {
      "code": "\nceph status\n\nroot@megamadhi:/var/log/apache2# ceph status\n   cluster 6a16b629-b5f8-4899-9f08-f4796c6719c9\n    health HEALTH_OK\n    monmap e1: 1 mons at {megamadhi=192.168.1.102:6789/0}\n           election epoch 1, quorum 0 megamadhi\n    osdmap e63: 3 osds: 3 up, 3 in\n     pgmap v22501: 458 pgs, 15 pools, 65227 MB data, 16814 objects\n           139 GB used, 2471 GB / 2750 GB avail\n                458 active+clean\n client io 12255 B/s rd, 1021 kB/s wr, 43 op/s",
      "language": "shell"
    }
  ]
}
[/block]
##Attach a rbd pool named `one`

We will add an rbd pool as a datastore to OpenNebula. We also have to provide a secret key generated here (marked in orange) to libvirt when setting up network.

Let us run this command from where ceph is installed.
[block:code]
{
  "codes": [
    {
      "code": "megdc cephds",
      "language": "text"
    }
  ]
}
[/block]
Note down the secret key as marked in orange.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/cdlcaozRWVPAcvjR1mAq",
        "megam_cephds.png",
        "1231",
        "240",
        "#6287d0",
        ""
      ]
    }
  ]
}
[/block]
##Add datastore in OpenNebula named `cephds`

Go the system where OpenNebula Frontend is installed. 
[block:code]
{
  "codes": [
    {
      "code": "sudo -H -u oneadmin bash -c \"cat > /var/lib/one/ds.conf <<EOF\nNAME = \\\"cephds\\\"\nDS_MAD = ceph\nTM_MAD = ceph\nDISK_TYPE = RBD\nCEPH_USER = libvirt\nCEPH_SECRET = <secret marked orange>\nPOOL_NAME = one\nBRIDGE_LIST = <ipaddr>\nCEPH_HOST = <hostname of ceph>\nEOF\"\n\nsudo -H -u oneadmin bash -c \"onedatastore create /var/lib/one/ds.conf\" ",
      "language": "shell"
    }
  ]
}
[/block]
 **Voila you are done.
[block:parameters]
{
  "data": {
    "0-1": "We hang around in our [public hipchat room](http://j.mp/megamchat).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
    "h-1": "Questions",
    "h-0": "Next up",
    "0-0": "If you want to add more compute/storage and High Availability then its time to upgrade to Rhino box.\n\nCheck out the next section on [What is RhinoBox ?](doc:megam_whatis_rhinobox).\n\n[Configure Megdc](doc:megam_configure_megdc) before moving on."
  },
  "cols": 2,
  "rows": 1
}
[/block]