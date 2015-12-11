---
title: "SSH into your torpedo"
excerpt: "Ok, you have a torpedo running, SSH into it."
---
# Torpedo is running, SSH into it.

The command appears in the **Torpedo overview" for your launch as well. 

On the Torpedo overview page, click on the link on the right side `SSH` to download your private key.

[block:code]
{
  "codes": [
    {
      "code": "chmod 600 <your_private_key>\n\nssh -i <your_private_key> root@<ip_address>",
      "language": "shell"
    }
  ]
}
[/block]
## Voila, I am in. 
[block:code]
{
  "codes": [
    {
      "code": "$ ssh -i id_rsa root@103.56.92.12\nWelcome to Ubuntu 14.04.1 LTS (GNU/Linux 3.13.0-32-generic x86_64)\n\n * Documentation:  https://help.ubuntu.com/\n\n137 packages can be updated.\n72 updates are security updates.\n\nroot@ubuntu:~# \n",
      "language": "shell"
    }
  ]
}
[/block]