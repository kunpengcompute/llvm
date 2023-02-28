LOCAL_PATH:= $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../../../../
include $(LLVM70_ROOT_PATH)/llvm70.mk

transforms_hello_SRC_FILES := \
  RegisterEHFrames.cpp \
  TargetExecutionUtils.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS = optional
LOCAL_C_INCLUDES += $(LLVM70_ROOT_PATH)/include/llvm/ExecutionEngine/Orc/TargetProcess
LOCAL_SRC_FILES := $(transforms_hello_SRC_FILES)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := LLVM70OrcTargetProcess

#LOCAL_MODULE_HOST_OS := darwin linux
LOCAL_LDFLAGS_darwin := -Wl,-undefined -Wl,dynamic_lookup

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS = optional
LOCAL_C_INCLUDES += $(LLVM70_ROOT_PATH)/include/llvm/ExecutionEngine/Orc/TargetProcess
LOCAL_SRC_FILES := $(transforms_hello_SRC_FILES)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := LLVM70OrcTargetProcess

#LOCAL_MODULE_HOST_OS := darwin linux
LOCAL_LDFLAGS_darwin := -Wl,-undefined -Wl,dynamic_lookup

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_SHARED_LIBRARY)
endif