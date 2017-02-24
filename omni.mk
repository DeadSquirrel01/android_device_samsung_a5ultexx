# include PAC common configuration
$(call inherit-product, vendor/omni/config/common.mk)
include vendor/cm/config/common.mk

$(call inherit-product, device/samsung/a5ultexx/omni_a5ultexx.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a5ultexx TARGET_DEVICE=a5ulte

PRODUCT_NAME := omni_a5ultexx
