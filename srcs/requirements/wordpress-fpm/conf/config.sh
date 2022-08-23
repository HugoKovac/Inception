#install wp-cli
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv -f wp-cli.phar /usr/local/bin/wp

#run php-fpm not daemonized
php-fpm7.3 -F