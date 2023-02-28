LOCAL_PATH:= $(call my-dir)

CF_Guard_SRC_FILES := \
  CFGuard.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(CF_Guard_SRC_FILES)

LOCAL_MODULE:= libLLVM70CFGuard

LOCAL_MODULE_HOST_OS := darwin linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(CF_Guard_SRC_FILES)

LOCAL_MODULE:= libLLVM70CFGuard

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
