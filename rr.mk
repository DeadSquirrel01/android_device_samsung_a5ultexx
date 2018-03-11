# include resurrection remix common configuration
$(call inherit-product, vendor/rr/config/common_full_phone.mk)
include vendor/rr/config/common.mk

$(call inherit-product, device/samsung/a5ultexx/rr_a5ultexx.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a5ultexx TARGET_DEVICE=a5ulte

PRODUCT_NAME := rr_a5ultexx
