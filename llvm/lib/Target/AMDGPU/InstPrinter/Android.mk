LOCAL_PATH := $(call my-dir)

amdgpu_instprinter_SRC_FILES := \
  AMDGPUInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM70AMDGPUAsmPrinter
LOCAL_MODULE_HOST_OS := linux

LOCAL_SRC_FILES := $(amdgpu_instprinter_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,true,)
LOCAL_STATIC_LIBRARIES += libLLVM70AMDGPUCodeGen
include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM70AMDGPUAsmPrinter

LOCAL_SRC_FILES := $(amdgpu_instprinter_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,,)
LOCAL_STATIC_LIBRARIES += libLLVM70AMDGPUCodeGen
include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
