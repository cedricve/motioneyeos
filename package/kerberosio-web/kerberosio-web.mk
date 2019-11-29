#############################################################
#
# Kerberos.io - Web
#
#############################################################

KERBEROSIO_WEB_VERSION = develop
KERBEROSIO_WEB_SITE = https://github.com/kerberos-io/web
KERBEROSIO_WEB_SITE_METHOD = git
KERBEROSIO_WEB_INSTALL_TARGET = YES
KERBEROSIO_WEB_DEPENDENCIES = kerberosio-machinery nginx php

##########################################################################
#
# The configuration requires to have PHP (+ curl and mcrypt extension) and
# nodejs/bower installed on the build machine.
#

define KERBEROSIO_WEB_BUILD_CMDS
    (cd $(@D); \
        $(TARGET_DIR)/usr/bin/php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php; \
        $(TARGET_DIR)/usr/bin/php composer-setup.php; \
        $(TARGET_DIR)/usr/bin/php -r "unlink('composer-setup.php');"; \
        $(TARGET_DIR)/usr/bin/php composer.phar install --no-dev; \
        $(TARGET_DIR)/usr/bin/php artisan key:generate; \
        cd public; \
        bower install --allow-root; \
        npm install grunt-contrib-watch grunt-contrib-less grunt-contrib-cssmin grunt-contrib-clean; \
				grunt cleanUpJS --force; \
				rm -rf node_modules; \
    )
endef

##########################################################################
#
# Copy the whole build directory to /var/www
#

define KERBEROSIO_WEB_INSTALL_TARGET_CMDS

    rm -rf $(TARGET_DIR)/var/www/web
    mkdir -p $(TARGET_DIR)/var/www
    cp -R $(@D) $(TARGET_DIR)/var/www/web

    # enable memcached
    cat $(TARGET_DIR)/etc/php.ini | grep -q extension=memcached.so || echo "extension=memcached.so" >> $(TARGET_DIR)/etc/php.ini

endef

$(eval $(generic-package))
