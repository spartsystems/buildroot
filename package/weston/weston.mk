################################################################################
#
# weston
#
################################################################################

WESTON_VERSION = 920a0331cf5340942a9d39ac3b48ce207f7970b6
WESTON_SITE = $(call github,zdobersek,WebKitForWayland,$(WESTON_VERSION))
WESTON_LICENSE = MIT
WESTON_LICENSE_FILES = COPYING

WESTON_INSTALL_STAGING = YES
WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
	jpeg mtdev udev cairo linux-pam

# We're touching Makefile.am
WESTON_AUTORECONF = YES

WESTON_CONF_OPT = \
	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
	--disable-xwayland \
	--disable-xwayland-test \
	--disable-x11-compositor \
	--disable-drm-compositor \
	--disable-wayland-compositor \
	--disable-headless-compositor \
	--disable-colord \
	--disable-libunwind

ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
WESTON_CONF_OPT += \
	--enable-fbdev-compositor \
	--disable-egl \
	--disable-simple-egl-clients
else
WESTON_CONF_OPT += --disable-fbdev-compositor
endif

ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
WESTON_DEPENDENCIES += rpi-userland
WESTON_CONF_OPT += \
	--enable-rpi-compositor \
	--enable-weston-launch \
	--enable-demo-clients-install \
	--with-cairo=image \
	--disable-resize-optimization \
	--disable-setuid-install \
	WESTON_NATIVE_BACKEND=rpi-backend.so
else
WESTON_CONF_OPT += --disable-rpi-compositor
endif # BR2_PACKAGE_WESTON_RPI

$(eval $(autotools-package))
