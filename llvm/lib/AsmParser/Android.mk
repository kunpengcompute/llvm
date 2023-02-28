LOCAL_PATH:= $(call my-dir)

asm_parser_SRC_FILES := \
  LLLexer.cpp \
  LLParser.cpp \
  Parser.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(asm_parser_SRC_FILES)

LOCAL_MODULE:= libLLVM70AsmParser

LOCAL_MODULE_HOST_OS := linux

include $(LOCAL_PATH)/../../llvm70-host-build.mk
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(asm_parser_SRC_FILES)

LOCAL_MODULE:= libLLVM70AsmParser

include $(LOCAL_PATH)/../../llvm70-device-build.mk
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
