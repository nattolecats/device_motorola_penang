#!/bin/sh

# Guard
if ! history | tail -n 1 | grep -q "cypfr"; then return; fi

# This is UNOFFICIAL build.
unset EVO_BUILD_TYPE

# Go to root of source
croot

# Setting up repos

KERNEL=device/motorola/cypfr-kernel/kernel
if ! [ -a $KERNEL ]; then git clone https://github.com/nattolecats/device_motorola_cypfr-kernel device/motorola/cypfr-kernel ; fi

KERNEL_SOURCE=kernel/motorola/msm-5.4
if ! [ -a $KERNEL_SOURCE ]; then git clone https://github.com/nattolecats/kernel_motorola_msm-5.4 kernel/motorola/msm-5.4 ; fi

VENDOR=vendor/motorola/cypfr/cypfr-vendor.mk
if ! [ -a $VENDOR ]; then git clone https://github.com/nattolecats/vendor_motorola_cypfr vendor/motorola/cypfr ; fi

VENDOR_PREBUILT=vendor/motorola/cypfr-prebuilt/vendor.img
if ! [ -a $VENDOR_PREBUILT ]; then 
    mkdir -p vendor/motorola/cypfr-prebuilt/
    curl -o $VENDOR_PREBUILT https://media.githubusercontent.com/media/nattolecats/vendor_motorola_cypfr-prebuilt/master/vendor.img
fi

FELICA=vendor/motorola/cypfr-felica/device.mk
if ! [ -a $FELICA ]; then git clone https://github.com/nattolecats/vendor_motorola_cypfr-felica vendor/motorola/cypfr-felica ; fi

MOTO=packages/apps/MotoActions/Android.mk
if ! [ -a $MOTO ]; then git clone https://github.com/nattolecats/packages_apps_MotoActions packages/apps/MotoActions ; fi

COMMON=device/motorola/common/common.mk
if ! [ -a $COMMON ]; then git clone https://github.com/moto-common/android_device_motorola_common device/motorola/common ; fi

PLATFORM_COMMON=device/motorola/sm4350-common/platform.mk
if ! [ -a $PLATFORM_COMMON ]; then git clone https://github.com/moto-common/android_device_motorola_sm4350-common device/motorola/sm4350-common ; fi

KERNEL_HEADERS=device/motorola/sm4350-common-kernel/kernel-headers
if ! [ -a $KERNEL_HEADERS ]; then git clone https://github.com/moto-common/android_device_motorola_sm4350-common-kernel device/motorola/sm4350-common-kernel ; fi

LOGCAT=packages/apps/Matlog/Android.bp
if ! [ -a $LOGCAT ]; then git clone https://github.com/crdroidandroid/android_packages_apps_Matlog packages/apps/Matlog ; fi

return
