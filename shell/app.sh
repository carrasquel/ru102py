#!/bin/sh

if [ "$DATABASE" = "redis" ]
then
  echo "Waiting for Redis..."

  while ! nc -z $REDIS_HOST $REDIS_PORT; do
    sleep 0.1
  done

  echo "Redis started"
fi

. env/bin/activate
FLASK_ENV=development FLASK_APP=$APP FLASK_DEBUG=1 flask run --port="$PORT" --host=0.0.0.0