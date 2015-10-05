



############################################################
#
# abus
#
############################################################

ABUS_VERSION = 1.0
ABUS_SOURCE = abus-1.0.tar.xz
ABUS_SITE = https://abus.googlecode.com/svn/trunk
ABUS_AUTORECONF = YES

ABUS_INSTALL_STAGING = YES
ABUS_INSTALL_TARGET = YES

ABUS_DEPENDENCIES = host-pkgconf

ABUS_CONF_OPT = --program-prefix="" 

ifeq ($(BR2_PACKAGE_LIBFCGI),y)
ABUS_DEPENDENCIES += libfcgi
ABUS_CONF_OPT += --enable-fcgi
endif

$(eval $(autotools-package))
$(eval $(host-autotools-package))