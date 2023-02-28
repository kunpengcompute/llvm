LOCAL_PATH := $(call my-dir)

amdgpu_utils_SRC_FILES := \
  AMDGPUAsmUtils.cpp \
  AMDGPUBaseInfo.cpp \
  AMDGPUPALMetadata.cpp \
  AMDKernelCodeTUtils.cpp
# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,true,)
LOCAL_STATIC_LIBRARIES += libLLVM70AMDGPUCodeGen
LOCAL_MODULE := libLLVM70AMDGPUUtils

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,,)
LOCAL_STATIC_LIBRARIES += libLLVM70AMDGPUCodeGen
LOCAL_MODULE := libLLVM70AMDGPUUtils

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
