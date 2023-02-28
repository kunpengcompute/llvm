LOCAL_PATH:= $(call my-dir)

Transforms_Coroutines_SRC_FILES := \
  CoroCleanup.cpp \
  CoroEarly.cpp \
  CoroElide.cpp \
  CoroFrame.cpp \
  CoroSplit.cpp \
  Coroutines.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(Transforms_Coroutines_SRC_FILES)

LOCAL_MODULE:= libLLVM70Coroutines

LOCAL_MODULE_HOST_OS := darwin linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(Transforms_Coroutines_SRC_FILES)

LOCAL_MODULE:= libLLVM70Coroutines

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
