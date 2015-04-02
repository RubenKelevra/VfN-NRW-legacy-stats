include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-legacy-https-stats
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(GLUONDIR)/include/package.mk

define Package/gluon-legacy-https-stats
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Legacy https stats
  DEPENDS:=+gluon-core +curl
endef

define Package/gluon-legacy-https-stats/description
	Gluon community wifi mesh firmware framework: legacy https stats
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Build/Compile
	CFLAGS="$(TARGET_CFLAGS)" CPPFLAGS="$(TARGET_CPPFLAGS)" $(MAKE) -C $(PKG_BUILD_DIR) $(TARGET_CONFIGURE_OPTS)
endef

define Package/gluon-legacy-https-stats/install
	$(CP) ./files/* $(1)/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ff-stats $(1)/usr/sbin/
endef

define Package/gluon-legacy-https-stats/postinst
#!/bin/sh

endef

$(eval $(call BuildPackage,gluon-legacy-https-stats))
