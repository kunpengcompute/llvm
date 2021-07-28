LOCAL_PATH := $(call my-dir)

#===---------------------------------------------------------------===
# libARMAsmParser (common)
#===---------------------------------------------------------------===
aarch64_asm_parser_TBLGEN_TABLES := \
  AArch64GenInstrInfo.inc           \
  AArch64GenRegisterInfo.inc        \
  AArch64GenAsmMatcher.inc          \
  AArch64GenSubtargetInfo.inc       \
  AArch64GenSystemOperands.inc

aarch64_asm_parser_SRC_FILES := \
  AArch64AsmParser.cpp

#===---------------------------------------------------------------===
# libAArch64AsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70AArch64AsmParser
LOCAL_MODULE_HOST_OS := linux

LOCAL_SRC_FILES := $(aarch64_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_TABLES := $(aarch64_asm_parser_TBLGEN_TABLES)
TBLGEN_IN_TD := AArch64.td

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libAArch64AsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70AArch64AsmParser

LOCAL_SRC_FILES := $(aarch64_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_TABLES := $(aarch64_asm_parser_TBLGEN_TABLES)
TBLGEN_IN_TD := AArch64.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
