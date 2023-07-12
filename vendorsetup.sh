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

GAPPS=vendor/gapps/Makefile
if ! [ -a $GAPPS ]; then git clone https://gitlab.com/MindTheGapps/vendor_gapps vendor/gapps ; fi

return
