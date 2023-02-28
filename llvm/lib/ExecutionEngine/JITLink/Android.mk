LOCAL_PATH:= $(call my-dir)
LLVM70_ROOT_PATH := $(LOCAL_PATH)/../../../
ExecutionEngine_JITLink_SRC_FILES := \
  JITLink.cpp \
  JITLinkGeneric.cpp \
  JITLinkMemoryManager.cpp \
  EHFrameSupport.cpp \
  MachO.cpp \
  MachO_arm64.cpp \
  MachO_x86_64.cpp \
  MachOLinkGraphBuilder.cpp \
  ELF.cpp \
  ELF_x86_64.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_C_INCLUDES := $(LLVM70_ROOT_PATH)/include/llvm/ExecutionEngine/Orc/TargetProcess

LOCAL_SRC_FILES := $(ExecutionEngine_JITLink_SRC_FILES)

LOCAL_MODULE:= libLLVM70JITLink

LOCAL_MODULE_HOST_OS := darwin linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))

LOCAL_C_INCLUDES := $(LLVM70_ROOT_PATH)/include/llvm/ExecutionEngine/Orc/TargetProcess

LOCAL_SRC_FILES := $(ExecutionEngine_JITLink_SRC_FILES)

LOCAL_MODULE:= libLLVM70JITLink

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
