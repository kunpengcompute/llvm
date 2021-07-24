LOCAL_PATH := $(call my-dir)

arm_asm_printer_SRC_FILES := \
  ARMInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(arm_asm_printer_SRC_FILES)

LOCAL_MODULE:= libLLVM70ARMAsmPrinter

LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70ARMCodeGen,true,)
LOCAL_STATIC_LIBRARIES += libLLVM70ARMCodeGen

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(arm_asm_printer_SRC_FILES)
LOCAL_C_INCLUDES+= $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70ARMCodeGen,,)
LOCAL_STATIC_LIBRARIES += libLLVM70ARMCodeGen

LOCAL_MODULE:= libLLVM70ARMAsmPrinter

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif

