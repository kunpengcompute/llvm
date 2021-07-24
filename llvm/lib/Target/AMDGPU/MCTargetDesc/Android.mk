LOCAL_PATH := $(call my-dir)

amdgpu_mc_desc_SRC_FILES := \
  AMDGPUAsmBackend.cpp      \
  AMDGPUELFObjectWriter.cpp \
  AMDGPUELFStreamer.cpp     \
  AMDGPUMCAsmInfo.cpp       \
  AMDGPUMCCodeEmitter.cpp   \
  AMDGPUMCTargetDesc.cpp    \
  AMDGPUTargetStreamer.cpp  \
  R600MCCodeEmitter.cpp     \
  R600MCTargetDesc.cpp      \
  SIMCCodeEmitter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM70AMDGPUDesc
LOCAL_MODULE_HOST_OS := linux

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES)
ifeq ($(LLVM_ANDROID_MAJOR_VERSION), 7)
    LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
        $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,,)
else
    LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
        $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,true,)
endif
LOCAL_STATIC_LIBRARIES += libLLVM70AMDGPUCodeGen
include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM70AMDGPUDesc

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,,)
LOCAL_STATIC_LIBRARIES += libLLVM70AMDGPUCodeGen
include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
