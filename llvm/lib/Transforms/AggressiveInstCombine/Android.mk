LOCAL_PATH:= $(call my-dir)

transforms_aggressive_SRC_FILES := \
  AggressiveInstCombine.cpp        \
  TruncInstCombine.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_aggressive_SRC_FILES)
LOCAL_MODULE:= libLLVM70AggressiveInstCombine

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_aggressive_SRC_FILES)
LOCAL_MODULE:= libLLVM70AggressiveInstCombine

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
