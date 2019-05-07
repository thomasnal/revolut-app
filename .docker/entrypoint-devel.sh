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

su $APP_USER -c "chown -R $APP_USER:$APP_USER $BUNDLE_PATH"
su $APP_USER -c "chown -R $APP_USER:$APP_USER /home/app"
su $APP_USER -c "mkdir -p $APP_HOME/tmp/pids"

su $APP_USER -c "bundle config --local path $BUNDLE_PATH >> $APP_HOME/log/startup.log 2>&1"
su $APP_USER -c "bundle check || bundle install >> $APP_HOME/log/startup.log 2>&1"

su $APP_USER -c "bundle exec rake db:setup >> $APP_HOME/log/db_migrate.log 2>&1"
su $APP_USER -c "bundle exec rake db:migrate >> $APP_HOME/log/db_migrate.log 2>&1"


/sbin/my_init
