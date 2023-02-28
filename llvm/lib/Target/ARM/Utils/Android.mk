LOCAL_PATH:= $(call my-dir)

arm_utils_SRC_FILES := \
  ARMBaseInfo.cpp


arm_utils_C_INCLUDES := $(LOCAL_PATH)/..

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70ARMUtils
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(arm_utils_SRC_FILES)
LOCAL_STATIC_LIBRARIES += libLLVM70ARMCodeGen
LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70ARMCodeGen,true,)
include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70ARMUtils
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(arm_utils_SRC_FILES)
LOCAL_STATIC_LIBRARIES += libLLVM70ARMCodeGen
LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70ARMCodeGen,,)

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
