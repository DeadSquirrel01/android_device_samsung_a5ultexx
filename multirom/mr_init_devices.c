#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    // Framebuffer
    "/sys/class/graphics/fb0",

    // ADB stuff
    "/sys/bus/usb",
    "/sys/class/misc/android_adb",
    "/sys/class/tty/ptmx",

    // EMMC stuff
    "/sys/block/mmcblk0",
    "/sys/devices/soc.0/7824900.sdhci",
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0",
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0/mmc0:0001",
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0",
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p16", // boot
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p25", // cache
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p2", // modem
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p22", // persist
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p24", // system
    "/sys/devices/soc.0/7824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p27", // userdata
    "/sys/block/mmcblk0",
    "/sys/bus/mmc",
    "/sys/bus/mmc/drivers/mmcblk",
    "/sys/devices/soc.0*",
    "/sys/module/mmcblk",
    "/sys/module/mmc_core",
    "/sys/devices/soc.0/78b5000.i2c/*",
    "/sys/devices/soc.0/78b8000.i2c/*",
    "/sys/devices/soc.0/78b9000.i2c/*",
    "/sys/devices/soc.0/78b000.i2c/*",

    // sdcard
    "/sys/devices/soc.0/7864900.sdhci/mmc_host/mmc1/mmc1:0007/block/mmcblk1",
    "/sys/devices/soc.0/7864900.sdhci/mmc_host/mmc1/mmc1:0007/block/mmcblk1*",

    // Input stuff
    "/sys/class/misc/uinput",
    "/sys/devices/soc.0/gpio_keys.80/input*",
    "/sys/devices/virtual/input*",

    // USB-OTG
    "/sys/devices/platform/msm_hsusb_host*",

 NULL
};
