# include lineage common configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
include vendor/lineage/config/common.mk

$(call inherit-product, device/samsung/a5ultexx/lineage_a5ultexx.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a5ultexx TARGET_DEVICE=a5ulte

PRODUCT_NAME := lineage_a5ultexx
