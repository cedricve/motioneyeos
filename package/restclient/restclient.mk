################################################################################
#
# restclient
#
################################################################################

RESTCLIENT_VERSION = b9ac3c8a8487927717596ac492eaa1366e152e87
RESTCLIENT_SITE = https://github.com/cedricve/restclient-cpp
RESTCLIENT_SITE_METHOD = git
RESTCLIENT_INSTALL_TARGET = YES

define RESTCLIENT_PRE_CONFIGURE_HOOKS
    bash autogen.sh
endef

$(eval $(autotools-package))
