LOCAL_PATH := $(call my-dir)

#===---------------------------------------------------------------===
# libARMAsmParser (common)
#===---------------------------------------------------------------===

arm_asm_parser_SRC_FILES := \
  ARMAsmParser.cpp

#===---------------------------------------------------------------===
# libARMAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70ARMAsmParser
LOCAL_MODULE_HOST_OS := linux
LOCAL_SRC_FILES := $(arm_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70ARMCodeGen,true,)
LOCAL_STATIC_LIBRARIES += libLLVM70ARMCodeGen

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libARMAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70ARMAsmParser
LOCAL_SRC_FILES := $(arm_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70ARMCodeGen,,)
LOCAL_STATIC_LIBRARIES += libLLVM70ARMCodeGen

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
