#
# Copyright (C) 2018 The Android Open-Source Project
#                    The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/pb/config/common.mk)


PRODUCT_COPY_FILES += device/WALTON/Primo_RX5/prebuilt/zImage:kernel
# Fles under $(LOCAL_PATH)/recovery/root/ gets automatically copied into recovery
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*

# ---------------------------------------------------------------
# From full_base.mk
# Put en_US first in the list, so make it default.
PRODUCT_LOCALES := en_US
# ---------------------------------------------------------------
# From core_minimal.mk
# Adoptable external storage supports both ext4 and f2fs
PRODUCT_PACKAGES += \
    bu \
    ip \
    logd \
    e2fsck \
    resize2fs \
    make_ext4fs \
    fsck.f2fs \
    make_f2fs
# ---------------------------------------------------------------
# From runtime_libart.mk
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    ro.dalvik.vm.native.bridge=0
# ---------------------------------------------------------------

# Test Override switches
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mtp,adb

# Try to keep the bootimg build props empty
BOOTIMAGE_BUILD_PROPERTIES += \
    ro.bootimage.build.date="" \
    ro.bootimage.build.date.utc=""

# ADDITIONAL_DEFAULT_PROPERTIES += \

# FINAL_DEFAULT_PROPERTIES += \

PRODUCT_BUILD_PROP_OVERRIDES += \
    ro.build.user=fr3aky \
    ro.build.host=phantom_zone \
    BUILD_FINGERPRINT="WALTON/Primo_RX5/Primo_RX5:6.0/MRA58K/1465782828:user/release-keys" \
    PRIVATE_BUILD_DESC="full_gionee6735_65u_m0-user 6.0 MRA58K 1465782828 release-keys"

# To override from ADDITIONAL_BUILD_PROPERTIES
# PRODUCT_PROPERTY_OVERRIDES += \

# ---------------------------------------------------------------

PRODUCT_DEVICE := Primo_RX5
PRODUCT_NAME := omni_Primo_RX5
PRODUCT_BRAND := WALTON
PRODUCT_MODEL := Primo_RX5
PRODUCT_MANUFACTURER := WALTON
