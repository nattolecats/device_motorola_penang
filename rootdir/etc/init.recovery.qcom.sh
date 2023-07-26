#!/system/bin/sh

if [[ $1 == "sideload" ]]; then
    rmmod moto_f_usbnet
else
    insmod /lib/modules/moto_f_usbnet.ko
fi
