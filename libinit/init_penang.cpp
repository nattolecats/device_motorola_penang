/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/properties.h>
#include <libinit_utils.h>
#include <libinit_dalvik_heap.h>

#include "vendor_init.h"

using android::base::GetProperty;

#define SKU_PROP "ro.boot.hardware.sku"

void set_variant_props(const std::string& model, const std::string& name, const std::string& fingerprint, const std::string& desc) {
    set_ro_build_prop("model", model, true);
    set_ro_build_prop("name", name, true);

    set_ro_build_prop("fingerprint", fingerprint);
    property_override("ro.bootimage.build.fingerprint", fingerprint);

    property_override("ro.build.description", desc);
}

void search_variant() {
    std::string current_sku = GetProperty(SKU_PROP, "");

    if (current_sku == "XT2335-4") { // Y!mobile SKU
        set_variant_props("moto g53y 5G",
                          "penang_sb",
                          "motorola/penang_sb/penang:13/T1TPJ33M.75-17-3/9c2f6:user/release-keys",
                          "penang_sb-user 13 T1TPJ33M.75-17-3 9c2f6 release-keys");
    } else { // Japan SIM-free SKU
        set_variant_props("moto g53j 5G",
                          "penang_g",
                          "motorola/penang_g/penang:13/T1TPS33M.1-73-2-2/723bee5:user/release-keys",
                          "penang_g-user 13 T1TPS33M.1-73-2-2 723bee5 release-keys");
    }
}

void vendor_load_properties() {
    search_variant();
    set_dalvik_heap();
}
