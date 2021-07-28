LOCAL_PATH:= $(call my-dir)

transforms_inst_combine_TBLGEN_TABLES := \
  InstCombineTables.inc

transforms_inst_combine_SRC_FILES := \
  InstCombineAddSub.cpp           \
  InstCombineAndOrXor.cpp         \
  InstCombineCalls.cpp            \
  InstCombineCasts.cpp            \
  InstCombineCompares.cpp         \
  InstCombineLoadStoreAlloca.cpp  \
  InstCombineMulDivRem.cpp        \
  InstCombinePHI.cpp              \
  InstCombineSelect.cpp           \
  InstCombineShifts.cpp           \
  InstCombineSimplifyDemanded.cpp \
  InstCombineVectorOps.cpp        \
  InstructionCombining.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(transforms_inst_combine_SRC_FILES)

LOCAL_MODULE:= libLLVM70InstCombine

TBLGEN_TABLES := $(transforms_inst_combine_TBLGEN_TABLES)
TBLGEN_IN_TD := InstCombineTables.td

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(transforms_inst_combine_SRC_FILES)

TBLGEN_TABLES := $(transforms_inst_combine_TBLGEN_TABLES)
TBLGEN_IN_TD := InstCombineTables.td

LOCAL_MODULE:= libLLVM70InstCombine

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
