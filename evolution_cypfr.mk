#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from cypfr device
$(call inherit-product, device/motorola/cypfr/device.mk)

# Inherit some common Evolution X stuff.
$(call inherit-product, vendor/evolution/config/common_full_phone.mk)

PRODUCT_NAME := evolution_cypfr
PRODUCT_DEVICE := cypfr
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g52j 5G

# Evolution X stuff
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_USES_MINI_GAPPS := true

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=cypfr_g \
    PRIVATE_BUILD_DESC="cypfr_g-user 12 S3RYBS32M.168-19-5-3 5e11d release-keys"

BUILD_FINGERPRINT := motorola/cypfr_g/cypfr:12/S3RYBS32M.168-19-5-3/5e11d:user/release-keys
