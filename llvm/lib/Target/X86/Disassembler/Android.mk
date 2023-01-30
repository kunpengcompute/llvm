LOCAL_PATH := $(call my-dir)

x86_disassembler_TBLGEN_TABLES := \
  X86GenDisassemblerTables.inc    \
  X86GenInstrInfo.inc             \
  X86GenRegisterInfo.inc          \
  X86GenSubtargetInfo.inc

x86_disassembler_SRC_FILES := \
  X86Disassembler.cpp


# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(x86_disassembler_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM70X86Disassembler

TBLGEN_TABLES := $(x86_disassembler_TBLGEN_TABLES)
TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_IN_TD := X86.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(x86_disassembler_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM70X86Disassembler

LOCAL_MODULE_HOST_OS := linux

TBLGEN_TABLES := $(x86_disassembler_TBLGEN_TABLES)
TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_IN_TD := X86.td

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
