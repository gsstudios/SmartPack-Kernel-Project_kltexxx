#
# LOS plus (AnyKernel) Script
#
# Credits: osm0sis @ xda-developers
#
# Originally modified by sunilpaulmathew@xda-developers.com
# Kernel by Saber@xda-developers.com
#

## AnyKernel setup
# begin properties
properties() {
kernel.string=LOS plus by Saber@xda-developers.com
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=kltexx
device.name2=kltelra
device.name3=kltetmo
device.name4=kltecan
device.name5=klteatt
device.name6=klteub
device.name7=klteacg
device.name8=klte
device.name9=kltekor
device.name10=klteskt
device.name11=kltektt
device.name12=kltelgt
device.name13=kltejpn
device.name14=kltekdi
device.name15=
} # end properties

# shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 755 $ramdisk

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc
backup_file init.rc;
grep "import /init.LOS-plus.rc" init.rc >/dev/null || sed -i '1,/.*import.*/s/.*import.*/import \/init.LOS-plus.rc\n&/' init.rc

# init.tuna.rc

# init.superuser.rc

# fstab.tuna

# end ramdisk changes

write_boot;

## end install

