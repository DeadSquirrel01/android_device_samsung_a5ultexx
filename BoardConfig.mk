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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# include qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/a5ultexx

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

# Arch
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_CORTEX_A53 := true

# Kernel
TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=enforcing
BOARD_KERNEL_BASE := 0x80000000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_DTBTOOL_ARG := -2
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := device/samsung/a5ultexx/prebuilt/kernel

# Partition sizes
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12775813120
BOARD_FLASH_BLOCK_SIZE := 131072

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# PowerHAL
TARGET_POWERHAL_VARIANT := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(LOCAL_PATH)/power/power_ext.c

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 65

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT := true

# Qcom
BOARD_USES_QC_TIME_SERVICES := true
TARGET_USES_QCOM_BSP := true
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
PROTOBUF_SUPPORTED := true
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# System.prop
TARGET_SYSTEM_PROP := device/samsung/a5ultexx/system.prop

# Display
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"

# Keys
BOARD_HAS_NO_SELECT_BUTTON := true

# Storage
TARGET_RECOVERY_FSTAB := device/samsung/a5ultexx/rootdir/etc/fstab.qcom

RECOVERY_SDCARD_ON_DATA := true

# TWRP
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 100
TW_MTP_DEVICE := "/dev/usb_mtp_gadget"
TW_EXCLUDE_SUPERSU := true

# MultiROM
TARGET_RECOVERY_IS_MULTIROM := true
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/a5ultexx/multirom/mr_init_devices.c
MR_DPI := xhdpi
MR_DPI_FONT := 216
MR_KEXEC_MEM_MIN := 0x85000000
MR_FSTAB := device/samsung/a5ultexx/multirom/mrom.fstab
MR_USE_MROM_FSTAB := true
MR_NO_KEXEC := 4
MR_CONTINUOUS_FB_UPDATE := true

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
