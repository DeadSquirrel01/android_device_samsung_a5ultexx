# include Omni common configuration
$(call inherit-product, vendor/omni/config/common.mk)

# APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Misc packages
$(call inherit-product, vendor/omni/config/packages.mk)

$(call inherit-product, device/samsung/a5ultexx/omni_a5ultexx.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a5ultexx TARGET_DEVICE=a5ulte

PRODUCT_NAME := omni_a5ultexx
