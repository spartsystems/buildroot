################################################################################
#
# openwebrtc
#
################################################################################

OPENWEBRTC_VERSION = 1598e6f612d257196db70d0cf930ede94f83497a
OPENWEBRTC_SITE = $(call github,WebRTCinWebKit,openwebrtc,$(OPENWEBRTC_VERSION))
OPENWEBRTC_INSTALL_STAGING = YES
OPENWEBRTC_LICENSE = BSD-2 Clause
OPENWEBRTC_LICENSE_FILES = LICENSE

OPENWEBRTC_CONFIGURE_CMDS = \
	(cd $(@D); \
	./autogen.sh; \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--program-prefix="" \
		--enable-bridge=no \
		--enable-introspection=no \
		--enable-tests=no \
		--disable-gtk-doc \
		$(DISABLE_NLS) \
		$(DISABLE_LARGEFILE) \
		$(SHARED_STATIC_LIBS_OPTS) \
		$(QUIET) \
	)

OPENWEBRTC_DEPENDENCIES = gstreamer1 gst1-plugins-openwebrtc libnice pulseaudio

$(eval $(autotools-package))
