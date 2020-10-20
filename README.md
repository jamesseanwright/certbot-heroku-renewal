# Certbot & Heroku SSL Renewal Script

A shell script to automate the renewal of Certbot SSL certificates and their deployment to Heroku SSL.

Please note that this only works with `certbot-auto` at present. For certificate renewals with `certbot`, see [jelko's fork](https://github.com/jelko/certbot-heroku-renewal).

## Usage

`sudo ./renew.sh DOMAIN HEROKU_APP_NAME`

* `DOMAIN` - the main domain name of the website you wish to renew. Can be found under `/etc/letsencrypt/live`
* `HEROKU_APP_NAME` the name of the Heroku app against which the SSL certificates will be updated

e.g. `sudo ./renew.sh foobar.co.uk foo-bar-app`

Due to the opinionated directory permissions required by Certbot, this script must be run as root.


## Conditionally Toggling The ACME Challenge Endpoint

The Heroku app against which I call this script has an ACME Challenge endpoint that can be toggled with an environment variable. This is commented out to demonstrate how this can be configured via the Heroku CLI.
