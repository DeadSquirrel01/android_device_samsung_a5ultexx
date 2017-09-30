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

LOCAL_PATH := device/samsung/a5ultexx

# Headers
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Platform
BOARD_VENDOR                 := samsung
TARGET_BOARD_PLATFORM        := msm8916
TARGET_BOARD_PLATFORM_GPU    := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME := MSM8916
TARGET_NO_BOOTLOADER         := true
BOARD_HAS_DOWNLOAD_MODE      := true

# Arch
TARGET_GLOBAL_CFLAGS        += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS      += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT          := cortex-a53
TARGET_CPU_CORTEX_A53       := true
TARGET_ARCH                 := arm
TARGET_CPU_ABI              := armeabi-v7a
TARGET_CPU_ABI2             := armeabi
TARGET_ARCH_VARIANT         := armv7-a-neon

# Kernel
TARGET_KERNEL_ARCH          := arm
BOARD_CUSTOM_BOOTIMG        := true
BOARD_CUSTOM_BOOTIMG_MK     := $(LOCAL_PATH)/mkbootimg.mk
BOARD_DTBTOOL_ARGS          := -2
BOARD_KERNEL_CMDLINE        := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
BOARD_KERNEL_BASE           := 0x80000000
BOARD_RAMDISK_OFFSET        := 0x02000000
BOARD_KERNEL_TAGS_OFFSET    := 0x01e00000
BOARD_KERNEL_SEPARATED_DT   := true
BOARD_KERNEL_PAGESIZE       := 2048
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8916
TARGET_KERNEL_CONFIG        := lineage_a5ultexx_essentials_defconfig

# Toolchain
KERNEL_TOOLCHAIN            := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX     := arm-eabi-

# Partition sizes
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE    := ext4
BOARD_HAS_LARGE_FILESYSTEM          := true
TARGET_USERIMAGES_USE_EXT4          := true
TARGET_USERIMAGES_USE_F2FS          := true
BOARD_BOOTIMAGE_PARTITION_SIZE      := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 167286400
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 2516582400
BOARD_PERSISTIMAGE_PARTITION_SIZE   := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE     := 209715200
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 12775813120
BOARD_FLASH_BLOCK_SIZE              := 131072

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE    := true
BOARD_CHARGER_ENABLE_SUSPEND     := true

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
QCOM_HARDWARE := true

# Enable QCOM FM feature
TARGET_QCOM_NO_FM_FIRMWARE  := true
BOARD_HAVE_QCOM_FM          := true

# Build our own PowerHAL
TARGET_POWERHAL_VARIANT             := qcom

# Touchscreen
TARGET_TAP_TO_WAKE_NODE := "/sys/class/sec/sec_touchscreen/wake_gesture"

# Wifi
BOARD_HAS_QCOM_WLAN               := true
BOARD_HOSTAPD_DRIVER              := NL80211
BOARD_HOSTAPD_PRIVATE_LIB         := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE                 := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER       := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB  := lib_driver_cmd_qcwcn
TARGET_PROVIDES_WCNSS_QMI         := true
TARGET_USES_QCOM_WCNSS_QMI        := true
TARGET_USES_WCNSS_CTRL            := true
WIFI_DRIVER_MODULE_PATH           := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME           := "wlan"
WPA_SUPPLICANT_VERSION            := VER_0_8_X

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH      := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS  := true
BOARD_VOLD_MAX_PARTITIONS            := 65

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT := true

# Qcom
BOARD_USES_QC_TIME_SERVICES         := true
TARGET_USES_QCOM_BSP                := true
TARGET_PLATFORM_DEVICE_BASE         := /devices/soc.0/
PROTOBUF_SUPPORTED                  := true
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE  := true

# Caf
TARGET_QCOM_MEDIA_VARIANT := caf-msm8916
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8916

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED       := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS        := 3
MAX_EGL_CACHE_KEY_SIZE                 := 12*1024
MAX_EGL_CACHE_SIZE                     := 2048*1024
OVERRIDE_RS_DRIVER                     := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS  := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

# Display
RECOVERY_GRAPHICS_USE_LINELENGTH  := true
TARGET_RECOVERY_PIXEL_FORMAT      := "RGB_565"

# Graphics
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# Keys
BOARD_CUSTOM_RECOVERY_KEYMAPPING  := ../../$(LOCAL_PATH)/recovery/recovery_keys.c
BOARD_HAS_NO_SELECT_BUTTON        := true

# Storage
TARGET_RECOVERY_FSTAB   := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
RECOVERY_SDCARD_ON_DATA := true

# Misc.
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Text Relocations
ALLOW_PLATFORM_TEXTRELS := true

# Multirom
DEVICE_RESOLUTION           := 720x1280
TARGET_RECOVERY_IS_MULTIROM := true
MR_INPUT_TYPE               := type_b
MR_INIT_DEVICES             := $(LOCAL_PATH)/multirom/mr_init_devices.c
MR_DPI                      := hdpi
MR_DPI_FONT                 := 170
MR_KEXEC_MEM_MIN            := 0x85000000
MR_FSTAB                    := $(LOCAL_PATH)/multirom/mrom.fstab
MR_USE_MROM_FSTAB           := true
MR_NO_KEXEC                 := 4
MR_CONTINUOUS_FB_UPDATE     := true
TW_NO_REBOOT_BOOTLOADER     := true
TW_HAS_DOWNLOAD_MODE        := true
TW_THEME                    := portrait_hdpi
TW_BRIGHTNESS_PATH          := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS           := 255
TW_DEFAULT_BRIGHTNESS       := 100
TW_MTP_DEVICE               := "/dev/mtp_usb"
TW_EXCLUDE_SUPERSU          := true

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
