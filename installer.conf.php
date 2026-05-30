;<?php exit; ?>
;*** DO NOT REMOVE THE LINE ABOVE ***
;------------------------------------------------------------------------------------------;
; Installer command line tool settings                                                     ;
;------------------------------------------------------------------------------------------;

[database]
type      = pgsql ; Either mysqli or pgsql
host      = askc8owogsgcoogsg4ssg00o
name      = revive_adserver
port      = 5432
username  = postgres
password  = WHkxWMseUeMOfzrqWtjuGf8QHNHir2A00B0GsMBAsiDDQFujU0yMqZLPkSgk5VYu

[table]
prefix  = rv_

[admin]
username  = admin
password  = secretsecret
email     = admin@example.com
language  = en
timezone  = ; empty to autodetect

[paths]
admin      = localhost/www/admin
delivery   = localhost/www/delivery
images     = localhost/www/images
imageStore = ; path to the image directory, empty to autodetect