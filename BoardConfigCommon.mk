# Copyright (C) 2013-2016, The CyanogenMod Project
# Copyright (C) 2017, The LineageOS Project
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

PLATFORM_PATH := device/samsung/msm8930-common

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Includes
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_CPU_VARIANT := krait

# Binder
TARGET_USES_64_BIT_BINDER := true

# HIDL
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(PLATFORM_PATH)/compatibility_matrix.xml

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Always preopt extracted APKs to prevent extracting out of the APK
# for gms modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := camera_parameters_samsung_msm8930
USE_DEVICE_SPECIFIC_CAMERA := true

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U

# Renderscript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Wifi driver
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_MODULE_PATH          := "/vendor/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# Move wcnss_service to vendor
PRODUCT_VENDOR_MOVE_ENABLED := true

# Include SE policies
include device/qcom/sepolicy-legacy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy
