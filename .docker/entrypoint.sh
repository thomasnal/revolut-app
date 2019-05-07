#!/bin/bash

adddate() {
    while IFS= read -r line; do
        echo "$(date) $line"
    done
}

APP_USER=app
APP_HOME=${APP_HOME:-"/var/www/html"}
APP_VERSION=${APP_VERSION/#/-}


echo "# Starting up container..." | adddate >> $APP_HOME/log/startup.log

su app -c "bundle exec rake db:migrate >> $APP_HOME/log/db_migrate.log 2>&1"


/sbin/my_init
