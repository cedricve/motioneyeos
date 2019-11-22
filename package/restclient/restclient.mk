################################################################################
#
# restclient
#
################################################################################

RESTCLIENT_VERSION = master
RESTCLIENT_SITE = https://github.com/cedricve/restclient-cpp
RESTCLIENT_SITE_METHOD = git
RESTCLIENT_INSTALL_TARGET = YES

$(eval $(autotools-package))
