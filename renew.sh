#!/usr/bin/env sh

letsencrypt_live_dir=/etc/letsencrypt/live
domain=$1
heroku_app=$2

if [ $(whoami) != "root" ]
then
    echo "Due to the default permissions of $letsencrypt_live_dir, this script must be executed as root."
    exit 1
fi

if [ ! -e ~/.netrc ]
then
    echo "Heroku auth token not found. Requesting credentials..."
    heroku login
fi

# Enabled ACME endpoint
# heroku config:set IS_ACME_ENABLED=true -a $heroku_app

sudo certbot certonly -n --standalone -d $domain

heroku certs:update $letsencrypt_live_dir/$domain/cert.pem \
    $letsencrypt_live_dir/$domain/privkey.pem \
    -a $heroku_app \
    --confirm $heroku_app

# Disables the ACME endpoint; see above.
# heroku config:unset IS_ACME_ENABLED -a $heroku_app
