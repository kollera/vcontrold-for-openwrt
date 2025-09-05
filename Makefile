include $(TOPDIR)/rules.mk

# Define the feed name and version
PKG_NAME:=vcontrold-feed
PKG_VERSION:=1.0
PKG_RELEASE:=1

# Specify the maintainer of the feed
PKG_MAINTAINER:=womoak75

# Define the source for the feed
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/womoak75/vcontrold-for-openwrt.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

# Include the package.mk file
include $(INCLUDE_DIR)/package.mk

# Build the vcontrold package
$(eval $(call BuildPackage,vcontrold))

