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

    // Override product first API level for avoid SN fails
    property_override("ro.product.first_api_level", "30", true);
}

void search_variant() {
    std::string current_sku = GetProperty(SKU_PROP, "");

    // Japan SIM-free model
    set_variant_props("moto g53j 5G",
                      "penang_g",
                      "motorola/penang_g/penang:13/T1TPS33M.1-73-2-2/723bee5:user/release-keys",
                      "penang_g-user 13 T1TPS33M.1-73-2-2 723bee5 release-keys");

    // For Y!mobile model
    //if (current_sku == "XT2335-4") property_override("ro.product.model", "moto g53y 5G");
}

void vendor_load_properties() {
    search_variant();
    set_dalvik_heap();
}
