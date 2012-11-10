# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.

COMMON_PATH := device/samsung/u8500-common

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Libs
PRODUCT_PACKAGES := \
	libstagefrighthw \
	libexifa \
	libjpega \
	com.android.future.usb.accessory

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	$(COMMON_PATH)/configs/asound.conf:system/etc/asound.conf \
	$(COMMON_PATH)/configs/cspsa.conf:system/etc/cspsa.conf \
	$(COMMON_PATH)/configs/gps.conf:system/etc/gps.conf \
	$(COMMON_PATH)/configs/nvram_net.txt:system/etc/nvram_net.txt \
	$(COMMON_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf \
	$(COMMON_PATH)/configs/vold.fstab:system/etc/vold.fstab \
	$(COMMON_PATH)/configs/egl.cfg:system/lib/egl/egl.cfg \
	$(COMMON_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Init files
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/init.u8500.rc:root/init.u8500.rc \
	$(COMMON_PATH)/rootdir/prerecovery.rc:root/prerecovery.rc \
	$(COMMON_PATH)/rootdir/ueventd.u8500.rc:root/ueventd.u8500.rc

# Non open-source common parts
$(call inherit-product-if-exists, vendor/samsung/u8500-common/common-vendor.mk)
