LOCAL_PATH := $(call my-dir)

aarch64_utils_TBLGEN_TABLES :=       \
  AArch64GenAsmWriter.inc            \
  AArch64GenAsmWriter1.inc           \
  AArch64GenRegisterInfo.inc         \
  AArch64GenSubtargetInfo.inc        \
  AArch64GenInstrInfo.inc            \
  AArch64GenSystemOperands.inc

aarch64_utils_SRC_FILES := \
  AArch64BaseInfo.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(aarch64_utils_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM70AArch64Utils

TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_TABLES := $(aarch64_utils_TBLGEN_TABLES)
TBLGEN_IN_TD := AArch64.td

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

LOCAL_SRC_FILES := $(aarch64_utils_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM70AArch64Utils

LOCAL_MODULE_HOST_OS := linux

TBLGEN_TD_DIR := $(LOCAL_PATH)/..
TBLGEN_TABLES := $(aarch64_utils_TBLGEN_TABLES)
TBLGEN_IN_TD := AArch64.td

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
