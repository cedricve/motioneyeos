################################################################################
#
# restclient
#
################################################################################

RESTCLIENT_VERSION = master
RESTCLIENT_MACHINERY_SITE = https://github.com/cedricve/restclient-cpp
RESTCLIENT_MACHINERY_SITE_METHOD = git
RESTCLIENT_MACHINERY_INSTALL_TARGET = YES

$(eval $(autotools-package))
