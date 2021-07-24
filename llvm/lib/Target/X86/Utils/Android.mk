LOCAL_PATH := $(call my-dir)

x86_utils_SRC_FILES := \
  X86ShuffleDecode.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(x86_utils_SRC_FILES)

ifeq ($(LLVM_ANDROID_MAJOR_VERSION), 7)
    LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
        $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70X86CodeGen,,)
else
    LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
        $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70X86CodeGen,true,)
endif
LOCAL_STATIC_LIBRARIES += libLLVM70X86CodeGen
LOCAL_MODULE:= libLLVM70X86Utils

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(x86_utils_SRC_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70X86CodeGen,,)
LOCAL_STATIC_LIBRARIES += libLLVM70X86CodeGen
LOCAL_MODULE:= libLLVM70X86Utils

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
