# include PAC common configuration
$(call inherit-product, vendor/pac/config/common_full_phone.mk)
include vendor/pac/config/pac_common.mk

# Enhanced NFC
$(call inherit-product, vendor/pac/config/nfc_enhanced.mk)

$(call inherit-product, device/samsung/a5ultexx/pac_a5ultexx.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a5ultexx TARGET_DEVICE=a5ulte

PRODUCT_NAME := pac_a5ultexx
