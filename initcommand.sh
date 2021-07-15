#!/bin/bash
echo "Waiting mysql to launch on 3306..."
while ! nc -z mysql 3306; do   
  sleep 0.5 # wait for 5/10 of the second before check again
done
echo "mysql launched"
echo "Waiting mailcatcher to launch on 1025..."
while ! nc -z mailcatcher 1025; do   
  sleep 0.5 # wait for 5/10 of the second before check again
done
echo "mailcatcher launched"
rails db:create
rails db:migrate
rake db:seed
rm -f tmp/pids/server.pid
rails server --binding 0.0.0.0 --port 3000