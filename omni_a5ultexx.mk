# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Bootanimation
TARGET_BOOTANIMATION_SIZE := 840x560

$(call inherit-product, vendor/omni/config/common.mk)

# APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Misc packages
$(call inherit-product, vendor/omni/config/packages.mk)

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/a5ultexx/a5ultexx-vendor.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/a5ultexx/overlay

# Inherit from a5-common
$(call inherit-product, device/samsung/a5-common/common.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := omni_a5ultexx
PRODUCT_DEVICE := a5ultexx
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-A500FU
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
