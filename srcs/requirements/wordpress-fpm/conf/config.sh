#!/bin/sh

until mysql --host=mariadb --user=$DB_USER --password=$DB_PASSWORD -e '\c'; do
  echo >&2 "mariadb is unavailable - sleeping"
  sleep 1
done


if ! wp core is-installed; then
  wp --allow-root core download
  wp config create \
    --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST
  wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME
  wp core install \
    --url="$DOMAIN_NAME" --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" --admin_email="$WP_ADMIN_EMAIL" --admin_password="$WP_ADMIN_PASSWORD"
  wp user create --porcelain \
    "$WP_AUTHOR_USER" "$WP_AUTHOR_EMAIL" --role=author --user_pass="$WP_AUTHOR_PASSWORD"
  chown -R 82:82 /var/www/html
fi

php-fpm8 -F