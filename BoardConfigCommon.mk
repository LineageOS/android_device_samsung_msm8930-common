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

# Don't try to build and run all tests by default. Several tests have
# dependencies on the framework.
ANDROID_NO_TEST_CHECK := true

# Audio
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_ext
USE_DEVICE_SPECIFIC_CAMERA := true

# Display
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Renderscript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Suppress EMMC WIPE
BOARD_SUPPRESS_EMMC_WIPE := true

# Filesystem
TARGET_EXFAT_DRIVER := exfat

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

# Include SE policies
#include device/qcom/sepolicy/sepolicy.mk
#BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy
