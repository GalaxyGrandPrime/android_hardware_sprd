LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

ISP_HW_VER := 1.0

TARGET_BOARD_CAMERA_READOTP_METHOD?=0

LOCAL_CFLAGS :=

ifeq ($(strip $(TARGET_BOARD_CAMERA_ISP_SOFTWARE_VERSION)),2)
ISP_HW_VER := 2.0
endif

ifeq ($(strip $(TARGET_BOARD_CAMERA_ISP_SOFTWARE_VERSION)),3)
ISP_HW_VER := 2.0
endif

ISP_LIB_PATH := libs/isp$(ISP_HW_VER)

LOCAL_C_INCLUDES := \
                external/skia/include/images \
                external/skia/include/core\
                external/jhead \
                external/sqlite/dist \
                system/media/camera/include \
                $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/source/include/video \
                $(LOCAL_PATH)/../../libmemoryheapion

ifeq ($(SOC_SCX30G_V2),true)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../gralloc/scx30g_v2
else
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../gralloc/sc8830
endif

include $(shell find $(LOCAL_PATH) -name 'Sprdroid.mk')

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_CFLAGS += -fno-strict-aliasing -Wno-unused-parameter -Wint-conversion

include $(LOCAL_PATH)/SprdCtrl.mk

LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := libutils libmemoryheapion libcamera_client libcutils libhardware libcamera_metadata libdl
LOCAL_SHARED_LIBRARIES += libui libbinder

include $(LOCAL_PATH)/SprdLib.mk
