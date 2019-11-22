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


RESTCLIENT_CONF_OPTS = \
	--target=$(GNU_TARGET_NAME) \
	--target-tools-prefix=$(TARGET_CROSS) \
	--prefix=/usr \
	-Dld="$(TARGET_CC)" \
	-Dccflags="$(TARGET_CFLAGS)" \
	-Dldflags="$(TARGET_LDFLAGS) -lm" \
	-Dmydomain="" \
	-Dmyhostname="noname" \
	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
	-Dosname=linux \
	-Dosvers=$(LINUX_VERSION) \
	-Dperladmin=root

$(eval $(autotools-package))
$(eval $(host-autotools-package))
