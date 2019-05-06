#!/bin/sh

echo "${COLOR?Need to set COLOR}"
echo "${FADE?Need to set FADE}"
echo "${BRIGHT?Need to set BRIGHT}"

KERNEL_VERSION=`uname -r`
MODULE_VERSION=`modinfo -F vermagic $KERNEL_VERSION/$1 |cut -f1 -d' '`


echo "$KERNEL_VERSION = $MODULE_VERSION"

if [ "$KERNEL_VERSION" = "$MODULE_VERSION" ] ; then
	echo "attempting to add  $1 to the kernel"
	insmod $KERNEL_VERSION/$1
fi

echo "ring,$BRIGHT,$FADE,$COLOR" > /writable_proc/acpi/nuc_led 
