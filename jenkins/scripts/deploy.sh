#!/usr/bin/env sh

set -x
docker network inspect jenkins_network >/dev/null 2>&1 || docker network create jenkins_network
docker run -d --name my-apache-php-app --network jenkins_network -p 80:80 -v $WORKSPACE/src:/var/www/html php:7.2-apache
sleep 5
set +x

echo 'Now...'
echo 'Visit http://my-apache-php-app to see your PHP application in action.'
