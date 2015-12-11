---
title: "Configuration"
excerpt: "There are caveats to look at when upgrading. We will fix it in an elegant way"
---
##Configure Oja

Here we will look at the configuration of Megam Oja. We recommend you do a [Health check](doc:megamoja_ping) Megam Oja before tweaking.

##[Gateway](https://github.com/megamsys/megam_gateway.git)

###Configuration

The notable configuration parameters of our api server code named: [gateway](https://github.com/megamsys/megam_gateway.git) are
[block:parameters]
{
  "data": {
    "h-0": "/var/lib/megam/megamgateway/gateway.conf",
    "0-0": "riak.url\n`\nThe riak url, shall be a hostname or ip\n`",
    "0-1": "localhost",
    "1-0": "sf.host\nsf.port\n\n`\nThe python based unique id server based on twitters snowflake  shall be a hostname or ip\n`",
    "2-0": "amqp.url\n\n`\nThe rabbitmq url in the amqp format.\n`",
    "1-1": "localhost\n7609",
    "2-1": "amqp://localhost:5672/vhost",
    "h-1": "value"
  },
  "cols": 2,
  "rows": 3
}
[/block]
##[Nilavu](https://github.com/megamsys/nilavu.git)

###Configuration

The notable configuration settings of our cockpit is 
[block:parameters]
{
  "data": {
    "0-0": "locale",
    "1-0": "riak\n`\nThe riak url, shall be  a hostname or ip\n`",
    "2-0": "http_api\n`\nThe gateway url, shall be a hostname or ip\n`",
    "2-1": "localhost",
    "0-1": "en",
    "3-0": "billings\n`\nEnable billing or not\n`",
    "3-1": "off",
    "4-0": "backup\n`\nEnable storage or not (like S3)\n`",
    "4-1": "enable:off",
    "1-1": "localhost",
    "h-0": "Nilavu /var/lib/megam/nilavu.yml",
    "h-1": "value"
  },
  "cols": 2,
  "rows": 5
}
[/block]
##[Megamd](https://github.com/megamsys/megamd.git)

### Configuration

The notable configuration settings of our omni scheduler are 
[block:parameters]
{
  "data": {
    "0-0": "[meta]\n    riak \n`\nThe riak url, shall be  a hostname or ip\n` \n    api \n`\nThe gateway url, can have a hostname or ip\n`",
    "0-1": "riak=[\"localhost:8087\"]\n\n\n\n\napi=\"https://api.megam.io/v2\"",
    "1-0": "amqp \n\n`\nThe rabbitmq url in the amqp format.\n`",
    "1-1": "amqp=\"amqp://guest:guest@localhost:5672/\"",
    "h-0": "Engine /var/lib/megam/megamd/megamd.conf",
    "h-1": "values"
  },
  "cols": 2,
  "rows": 2
}
[/block]

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue button\" href=\"http://docs.megam.io/docs/debian\" role=\"button\">Go to launch torpedo</a><style></style>"
}
[/block]