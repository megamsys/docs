---
title: "Marketplaces"
excerpt: "Ok, this is a stock marketplace, can i expand it ?"
---
#Bring your own marketplace

Yeah sure. If you notice the `marketplace` shown by [Megam Oja: Nilavu](doc:megam_oja_install)  is loaded from the file `/var/lib/megam/megamgateway/marketplaces.yaml`


[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/w95GUinQtqbOhWfjI1VQ",
        "marketplace.png",
        "258",
        "230",
        "#5e6e76",
        ""
      ]
    }
  ]
}
[/block]
Let us say we want to `Elastic search` into our kitty just so our dev team can use that in oneclick
[block:code]
{
  "codes": [
    {
      "code": "marketplaces:\n Elasticsearch:\n  cattype: SERVICE\n  order: 3\n  image: elasticsearch.png\n  url: https://redis.org\n  envs:\n   host:\n   port: 6379\n   username:\n   password:\n  plans:\n   2.8.4:\n    description: \"Elasticsearch is an awesome key value store with blah..\"\n",
      "language": "yaml"
    }
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "cattype\nThe following are supported catalogue types:",
    "0-1": "APP\nSERVICE\nANALYTICS\nCOLLABORATION\nMICROSERVICE\nTORPEDO",
    "h-1": "Description",
    "h-0": "Fields",
    "1-0": "envs\n\nHelps to push any number of environment variable inside the virtual machine.",
    "1-1": "The environment variables are populated inside a virtual machine automatically based on the distro types.\n\nSome of the values are prepopulated automatically for a lunch. \n\nemail: <email>\napi_key: <api_key>\nassembly_id: <assembly_id>",
    "2-0": "plans",
    "2-1": "plans provide ability to support multiple version of the software"
  },
  "cols": 2,
  "rows": 3
}
[/block]