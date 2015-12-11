---
title: "Troubleshooting"
excerpt: "After the environment is set,  we need to verify the health of the installed servers are going great."
---
# Up is down

After the install is complete, we found that a report would be nice to let us know that things are up.


[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/Q3UDYYpqTAWiXy74fMEX",
        "apps-health-ico.png",
        "286",
        "286",
        "#5e6e76",
        ""
      ]
    }
  ]
}
[/block]
## Megdc oja report

The first step is to pull a report of the install and the services using megdc
[block:code]
{
  "codes": [
    {
      "code": "megdc megamreport",
      "language": "shell"
    }
  ]
}
[/block]
## Oja up

[Type http://<your_ip>:7777](http://<your_ip>:7777) on a browser

This produces an elaborate report of the various components of Megam Oja. In the below report all the stuff is WORKING, except megamd:docker. As this is optional, its safe to continue.
[block:code]
{
  "codes": [
    {
      "code": "[\n  {\n    \"Name\": \"megamd:riak\",\n    \"Status\": \"WORKING\",\n    \"Raw\": \"[192.168.1.105:8087] up\",\n    \"Duration\": 1011727\n  },\n  {\n    \"Name\": \"megamd:one\",\n    \"Status\": \"WORKING\",\n    \"Raw\": \"one http:\\/\\/192.168.1.105:2633\\/RPC2 ready\",\n    \"Duration\": 21556\n  },\n  {\n    \"Name\": \"megamd:docker\",\n    \"Status\": \"fail - ping failed - Get http:\\/\\/192.168.1.247:2375\\/_ping: dial tcp 192.168.1.247:2375: getsockopt: no route to host\",\n    \"Raw\": null,\n    \"Duration\": 2999285211\n  },\n  {\n    \"Name\": \"megamd:amqp\",\n    \"Status\": \"WORKING\",\n    \"Raw\": \"amqp:\\/\\/guest:guest@192.168.1.105:5672\\/ up\",\n    \"Duration\": 7690643\n  },\n  {\n    \"Name\": \"gateway\",\n    \"Status\": \"WORKING\",\n    \"Raw\": {\n      \"status\": {\n        \"rabbitmq\": \"up\",\n        \"riak\": \"up\",\n        \"snowflake\": \"up\"\n      },\n      \"runtime\": {\n        \"cores\": \"8\",\n        \"freemem\": \"469 MB\",\n        \"freespace\": \"56 of 85 GB\",\n        \"total_mem\": \"546 MB\"\n      },\n      \"loaded\": {\n        \"ANALYTICS.Hadoop\": \"hadoop.png.1,MKP1286236643912712192\",\n        \"ANALYTICS.HotelAAP\": \"spark.png.1,MKP1286236643375841280\",\n        \"ANALYTICS.Spark\": \"spark.png.1,MKP1286236643719774208\",\n        \"ANALYTICS.SparkNotebook\": \"sparknotebook.png.1,MKP1286236643782688768\",\n        \"APP.Java\": \"java.png.1,MKP1286236643883352064\",\n        \"APP.Nodejs\": \"nodejs.png.1,MKP1286236643333898240\",\n        \"APP.PHP\": \"php.png.1,MKP1286236643610722304\",\n        \"APP.Play\": \"play.png.1,MKP1286236643451338752\",\n        \"APP.Rails\": \"rails.png.1,MKP1286236643535224832\",\n        \"COLLABORATION.Owncloud\": \"owncloud.png.1,MKP1286236643413590016\",\n        \"COLLABORATION.VirtualOffice\": \"virtual_office.png.1,MKP1286236643262595072\",\n        \"COLLABORATION.Zarafa\": \"zarafa.png.1,MKP1286236643300343808\",\n        \"MICROSERVICES.DockerBox\": \"dockerbox.png.1,MKP1286236643845603328\",\n        \"MICROSERVICES.DockerContainer\": \"dockercontainer.png.1,MKP1286236643493281792\",\n        \"SERVICE.Mysql\": \"mysql.png.1,MKP1286236643753328640\",\n        \"SERVICE.PostgreSQL\": \"postgres.png.1,MKP1286236643229040640\",\n        \"SERVICE.RabbitMQ\": \"rabbitmq.png.1,MKP1286236643572973568\",\n        \"SERVICE.Redis\": \"redis.png.1,MKP1286236643816243200\",\n        \"SERVICE.Riak\": \"riak.png.1,MKP1286236643682025472\",\n        \"TORPEDO.CentOS\": \"centos.png.1,MKP1286236643140960256\",\n        \"TORPEDO.CoreOS\": \"coreos.png.1,MKP1286236643191291904\",\n        \"TORPEDO.Debian\": \"debian.png.1,MKP1286236643644276736\",\n        \"TORPEDO.Ubuntu\": \"ubuntu.png.1,MKP1286236643937878016\"\n      }\n    },\n    \"Duration\": 2098024\n  },\n  {\n    \"Name\": \"leveldb\",\n    \"Status\": \"WORKING\",\n    \"Raw\": \"riak_kv_eleveldb_backend\",\n    \"Duration\": 12681748\n  },\n  {\n    \"Name\": \"nilavu\",\n    \"Status\": \"WORKING\",\n    \"Raw\": {\n      \"Billings\": \"off\",\n      \"Backup\": {\n        \"Enable\": \"off\",\n        \"Host\": \"localhost\",\n        \"Username\": \"megdc\",\n        \"Password\": \"megdc\"\n      },\n      \"Locale\": \"en\",\n      \"Nilavu\": \"https:\\/\\/console.megam.io\",\n      \"Riak\": \"192.168.1.105\",\n      \"Api\": \"192.168.1.105\",\n      \"Logs\": \"madai.megam.io\\/logs\",\n      \"Gitlab\": \"\",\n      \"Notification\": {\n        \"Use\": \"mailgun\",\n        \"Enable\": \"on\",\n        \"Smtp\": {\n          \"Email\": \"support@megam.io\",\n          \"Password\": \"<%= ENV[\\\"NIL_EMAIL_PASSWORD\\\"] %>\"\n        },\n        \"Mailgun\": {\n          \"Api_key\": \"<%= ENV[\\\"NIL_MAILGUN_APIKEY\\\"] %>\",\n          \"Domain\": \"ojamail.megambox.com\"\n        },\n        \"Hipchat\": {\n          \"Api_key\": \"<%= ENV[\\\"NIL_HIP_APIKEY\\\"] %>\",\n          \"Room\": \"Megam\"\n        }\n      }\n    },\n    \"Duration\": 655065\n  }\n]",
      "language": "json",
      "name": "Oja ping"
    }
  ]
}
[/block]