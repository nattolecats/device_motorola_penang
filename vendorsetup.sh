#!/bin/sh

# Go to root of source
croot

# Setting up repos

KERNEL=device/motorola/cypfr-kernel/kernel
if ! [ -a $KERNEL ]; then git clone https://github.com/nattolecats/device_motorola_cypfr-kernel device/motorola/cypfr-kernel ; fi

VENDOR=vendor/motorola/cypfr/cypfr-vendor.mk
if ! [ -a $VENDOR ]; then git clone https://github.com/nattolecats/vendor_motorola_cypfr vendor/motorola/cypfr ; fi

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

return
