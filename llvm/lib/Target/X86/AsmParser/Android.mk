LOCAL_PATH := $(call my-dir)

# For the device only
# =====================================================
include $(CLEAR_VARS)

x86_asm_parser_TBLGEN_TABLES := \
  X86GenAsmMatcher.inc          \
  X86GenInstrInfo.inc           \
  X86GenRegisterInfo.inc        \
  X86GenSubtargetInfo.inc

x86_asm_parser_SRC_FILES := \
  X86AsmParser.cpp

#===---------------------------------------------------------------===
# libX86AsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70X86AsmParser
LOCAL_MODULE_HOST_OS := linux
LOCAL_SRC_FILES := $(x86_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

TBLGEN_TABLES := $(x86_asm_parser_TBLGEN_TABLES)
TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_IN_TD := X86.td

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libX86AsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70X86AsmParser
LOCAL_SRC_FILES := $(x86_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

TBLGEN_TABLES := $(x86_asm_parser_TBLGEN_TABLES)
TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_IN_TD := X86.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
