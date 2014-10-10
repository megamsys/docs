



Network configuration



Cobblerd

base_megamreporting_enabled: 1

# Email out a report when cobbler finishes installing a system.
# enabled: set to 1 to turn this feature on
# sender: optional
# email: which addresses to email
# smtp_server: used to specify another server for an MTA
# subject: use the default subject unless overridden
build_reporting_enabled: 1
build_reporting_sender: "admin@megam.co.in"
build_reporting_email: [ 'nkishore@megam.co.in' ]
build_reporting_smtp_server: "smtp.sendgrid.net"
build_reporting_subject: "Node is ready"
build_reporting_ignorelist: [ "" ]
