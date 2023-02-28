LOCAL_PATH := $(call my-dir)

arm_disassembler_SRC_FILES := \
  ARMDisassembler.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70ARMCodeGen,true,)
LOCAL_STATIC_LIBRARIES += libLLVM70ARMCodeGen

LOCAL_MODULE:= libLLVM70ARMDisassembler

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70ARMCodeGen,,)
LOCAL_STATIC_LIBRARIES += libLLVM70ARMCodeGen

LOCAL_MODULE:= libLLVM70ARMDisassembler

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
