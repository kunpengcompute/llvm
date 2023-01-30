LOCAL_PATH:= $(call my-dir)

demangle70_SRC_FILES := \
  Demangle.cpp          \
  ItaniumDemangle.cpp   \
  MicrosoftDemangle.cpp \
  MicrosoftDemangleNodes.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70Demangle
LOCAL_MODULE_HOST_OS := linux
LOCAL_SRC_FILES := $(demangle70_SRC_FILES)

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70Demangle
LOCAL_SRC_FILES := $(demangle70_SRC_FILES)

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
