LOCAL_PATH := $(call my-dir)

HAL      := halimpl/bcm2079x/hal
UDRV     := halimpl/bcm2079x/udrv
HALIMPL  := halimpl/bcm2079x
D_CFLAGS := \
    -DANDROID -DBUILDCFG=1 \
    -Wno-deprecated-register \
    -Wno-unused-parameter \
    -Wno-missing-field-initializers \
    -Wno-unused-function \
    -Wno-unused-variable \
    -Wno-macro-redefined

include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_VENDOR_MODULE := true

LOCAL_MODULE := nfc_nci.$(TARGET_BOARD_PLATFORM)

LOCAL_SRC_FILES := \
    $(call all-c-files-under, $(HALIMPL)) \
    $(call all-cpp-files-under, $(HALIMPL))

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    liblog \
    libhwbinder

LOCAL_HEADER_LIBRARIES := \
    libhardware_headers \
    libhardware_legacy_headers

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/$(HALIMPL)/include \
    $(LOCAL_PATH)/$(HALIMPL)/gki/ulinux \
    $(LOCAL_PATH)/$(HALIMPL)/gki/common \
    $(LOCAL_PATH)/$(HAL)/include \
    $(LOCAL_PATH)/$(HAL)/int \
    $(LOCAL_PATH)/$(UDRV)/include

LOCAL_CFLAGS := \
    $(D_CFLAGS) \
    -DNFC_HAL_TARGET=TRUE \
    -DNFC_RW_ONLY=TRUE

include $(BUILD_SHARED_LIBRARY)
