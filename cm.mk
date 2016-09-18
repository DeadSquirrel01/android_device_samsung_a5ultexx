# include PAC common configuration
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
include vendor/cm/config/common.mk

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/samsung/a5ultexx/cm_a5ultexx.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a5ultexx TARGET_DEVICE=a5ulte

PRODUCT_NAME := cm_a5ultexx
