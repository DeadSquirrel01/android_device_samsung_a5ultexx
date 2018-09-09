/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <android-base/file.h>
#include <android-base/properties.h>
#include <android-base/logging.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"

using android::base::GetProperty;
using android::init::property_set;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[],
        char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void init_dsds() {
    property_set("ro.multisim.set_audio_params", "true");
    property_set("ro.multisim.simslotcount", "2");
    property_set("persist.radio.multisim.config", "dsds");
}

void vendor_load_properties()
{
    // Init a dummy BT MAC address, will be overwritten later
    property_set("ro.boot.btmacaddr", "00:00:00:00:00:00");

    std::string platform = GetProperty("ro.board.platform","");
    if (platform != ANDROID_TARGET)
        return;

    std::string bootloader = GetProperty("ro.bootloader","");

    if (bootloader.find("A500FU") == 0) {
        /* SM-A500FU */
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/a5ultexx/a5ulte:7.1/NDE63X/A500FUXXU1CPG1:user/release-keys");
        property_override("ro.build.description", "a5ultexx-user 7.1 NDE63X A500FUXXU1CPG1 release-keys");
        property_override_dual("ro.product.model", "ro.vendor.product.model", "SM-A500FU");
        property_override_dual("ro.product.device", "ro.vendor.product.device", "a5ulte");
    } else if (bootloader.find("A500F") == 0) {
        /* SM-A500F */
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/a5ltexx/a5lte:5.0.2/LRX22G/A500FXXU1BOH4:user/release-keys");
        property_override("ro.build.description", "a5ltexx-user 5.0.2 LRX22G A500FXXU1BOH4 release-keys");
        property_override_dual("ro.product.model", "ro.vendor.product.model", "SM-A500F");
        property_override_dual("ro.product.device", "ro.vendor.product.device", "a5lte");

        init_dsds();
    } else if (bootloader.find("A500G") == 0) {
        /* SM-A500G */
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/a5ltedd/a5lte:5.0.2/LRX22G/A500GXXU1BOJ2:user/release-keys");
        property_override("ro.build.description", "a5ltedd-user 5.0.2 LRX22G A500GXXU1BOJ2 release-keys");
        property_override_dual("ro.product.model", "ro.vendor.product.model", "SM-A500G");
        property_override_dual("ro.product.device", "ro.vendor.product.device", "a5lte");

        init_dsds();
    } else if (bootloader.find("A500M") == 0) {
        /* SM-A500M */
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/a5lteub/a5lte:5.0.2/LRX22G/A500MUBU1BPB2:user/release-keys");
        property_override("ro.build.description", "a5lteub-user 5.0.2 LRX22G A500MUBU1BPB2 release-keys");
        property_override_dual("ro.product.model", "ro.vendor.product.model", "SM-A500M");
        property_override_dual("ro.product.device", "ro.vendor.product.device", "a5lte");

        init_dsds();
    } else if (bootloader.find("A500L") == 0) {
        /* SM-A500L */
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/a5ultelgt/a5ulte:6.0.1/MMB29M/A500LKLU1CQA1:user/release-keys");
        property_override("ro.build.description", "a5ultelgt-user 6.0.1 MMB29M A500LKLU1CQA1 release-keys");
        property_override_dual("ro.product.model", "ro.vendor.product.model", "SM-A500L");
        property_override_dual("ro.product.device", "ro.vendor.product.device", "a5ulte");

        init_dsds();
    }

    std::string device = GetProperty("ro.product.device","");
    LOG(ERROR) << "Found bootloader id %s setting build properties for %s device\n" << bootloader.c_str() << device.c_str();
}
