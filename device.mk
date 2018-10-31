# Copyright (C) 2015 The CyanogenMod Project
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
#

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/a5ultexx/a5ultexx-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# dtbTool
PRODUCT_PACKAGES += \
    dtbTool.msm8916

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.usb.rc \
    ueventd.qcom.rc \
    init.qcom.post_boot.sh \
    init.carrier.rc \
    init.class_main.sh \
    init.qcom.bt.sh \
    init.qcom.uicc.sh \
    init.qcom.early_boot.sh \
    init.qcom.usb.sh \
    init.qcom.fm.sh \
    init.qcom.sh \
    init.recovery.qcom.rc

# Filesystem
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs

# For TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab
