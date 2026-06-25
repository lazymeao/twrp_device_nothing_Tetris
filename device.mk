DEVICE_PATH := device/nothing/Tetris

# API
PRODUCT_SHIPPING_API_LEVEL := 32
PRODUCT_TARGET_VNDK_VERSION := 34

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    system_ext \
    vendor 
  
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    otapreopt_script \
    checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=$(BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=$(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_vendor=true

# Additional Target Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.graphics.common@1.0 \
    libion \
    libxml2

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.graphics.common@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so

# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# MTK plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# HIDL Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# Recovery init
PRODUCT_PACKAGES += \
    init.recovery.mt6886.rc

# Filesystem table
PRODUCT_PACKAGES += \
    recovery.fstab \

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1
	
# Security
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

# Keystore Hal
PRODUCT_PACKAGES += \
    android.system.keystore2

# Additional configs
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1

# Rootdir
PRODUCT_PACKAGES += \
    servicemanager.recovery.rc \
    snapuserd.rc
