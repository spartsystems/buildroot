################################################################################
#
# gst1-plugins-openwebrtc
#
################################################################################

GST1_PLUGINS_OPENWEBRTC_VERSION = 1ac22ca64a56137cf0d55f4636ecae13123c44bb
GST1_PLUGINS_OPENWEBRTC_SITE = $(call github,EricssonResearch,openwebrtc-gst-plugins,$(GST1_PLUGINS_OPENWEBRTC_VERSION))
GST1_PLUGINS_OPENWEBRTC_INSTALL_STAGING = YES
GST1_PLUGINS_OPENWEBRTC_LICENSE_FILES = LICENSE
GST1_PLUGINS_OPENWEBRTC_LICENSE = BSD-2 Clause

GST1_PLUGINS_OPENWEBRTC_AUTORECONF = YES

GST1_PLUGINS_OPENWEBRTC_MAKE_OPT += -j1

define M4_FIX
	mkdir -p $(@D)/m4
endef
GST1_PLUGINS_OPENWEBRTC_POST_EXTRACT_HOOKS += M4_FIX

GST1_PLUGINS_OPENWEBRTC_DEPENDENCIES = gst1-plugins-base libusrsctp

$(eval $(autotools-package))