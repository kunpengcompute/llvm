LOCAL_PATH := $(call my-dir)
LLVM70_ROOT_PATH := $(LOCAL_PATH)

FORCE_BUILD_LLVM70_DISABLE_NDEBUG ?= false
# Legality check: FORCE_BUILD_LLVM70_DISABLE_NDEBUG should consist of one word -- either "true" or "false".
ifneq "$(words $(FORCE_BUILD_LLVM70_DISABLE_NDEBUG))$(words $(filter-out true false,$(FORCE_BUILD_LLVM70_DISABLE_NDEBUG)))" "10"
  $(error FORCE_BUILD_LLVM70_DISABLE_NDEBUG may only be true, false, or unset)
endif

FORCE_BUILD_LLVM70_DEBUG ?= false
# Legality check: FORCE_BUILD_LLVM70_DEBUG should consist of one word -- either "true" or "false".
ifneq "$(words $(FORCE_BUILD_LLVM70_DEBUG))$(words $(filter-out true false,$(FORCE_BUILD_LLVM70_DEBUG)))" "10"
  $(error FORCE_BUILD_LLVM70_DEBUG may only be true, false, or unset)
endif
include $(CLEAR_VARS)

LLVM70_TBLGEN := $(BUILD_OUT_EXECUTABLES)/llvm70-tblgen$(BUILD_EXECUTABLE_SUFFIX)

# LLVM70 Libraries
subdirs := \
  lib/Analysis \
  lib/AsmParser \
  lib/BinaryFormat \
  lib/Bitcode/Reader \
  lib/Bitcode/Writer \
  lib/ExecutionEngine \
  lib/ExecutionEngine/RuntimeDyld \
  lib/ExecutionEngine/MCJIT \
  lib/ExecutionEngine/Orc \
  lib/ExecutionEngine/Interpreter \
  lib/CodeGen \
  lib/CodeGen/AsmPrinter \
  lib/CodeGen/GlobalISel \
  lib/CodeGen/MIRParser \
  lib/CodeGen/SelectionDAG \
  lib/DebugInfo/DWARF \
  lib/DebugInfo/PDB \
  lib/DebugInfo/MSF \
  lib/DebugInfo/Symbolize \
  lib/DebugInfo/CodeView \
  lib/Demangle \
  lib/IR \
  lib/IRReader \
  lib/Linker \
  lib/LTO \
  lib/MC \
  lib/MC/MCDisassembler \
  lib/MC/MCParser \
  lib/Object \
  lib/Option \
  lib/Passes \
  lib/ProfileData \
  lib/ProfileData/Coverage \
  lib/Support \
  lib/TableGen \
  lib/Target \
  lib/Transforms/IPO \
  lib/Transforms/InstCombine \
  lib/Transforms/Instrumentation \
  lib/Transforms/ObjCARC \
  lib/Transforms/Scalar \
  lib/Transforms/Utils \
  lib/Transforms/Vectorize \
  lib/Transforms/AggressiveInstCombine \
  lib/ToolDrivers/llvm-lib

# ARM Code Generation Libraries
subdirs += \
  lib/Target/ARM \
  lib/Target/ARM/AsmParser \
  lib/Target/ARM/InstPrinter \
  lib/Target/ARM/Disassembler \
  lib/Target/ARM/MCTargetDesc \
  lib/Target/ARM/TargetInfo \
  lib/Target/ARM/Utils

# AArch64 Code Generation Libraries
subdirs += \
  lib/Target/AArch64  \
  lib/Target/AArch64/AsmParser \
  lib/Target/AArch64/InstPrinter \
  lib/Target/AArch64/Disassembler \
  lib/Target/AArch64/MCTargetDesc \
  lib/Target/AArch64/TargetInfo \
  lib/Target/AArch64/Utils

# MIPS Code Generation Libraries
# ignore MIPS

# X86 Code Generation Libraries
subdirs += \
  lib/Target/X86 \
  lib/Target/X86/AsmParser \
  lib/Target/X86/InstPrinter \
  lib/Target/X86/Disassembler \
  lib/Target/X86/MCTargetDesc \
  lib/Target/X86/TargetInfo \
  lib/Target/X86/Utils

# AMDGPU Code Generation Libraries
subdirs += \
  lib/Target/AMDGPU \
  lib/Target/AMDGPU/AsmParser \
  lib/Target/AMDGPU/Disassembler \
  lib/Target/AMDGPU/InstPrinter \
  lib/Target/AMDGPU/MCTargetDesc \
  lib/Target/AMDGPU/TargetInfo \
  lib/Target/AMDGPU/Utils

# LLVM70 Command Line Utilities
subdirs += \
  utils/TableGen


$(warning "dedesde~~~~~ $(LLVM70_ROOT_PATH)")
include $(LLVM70_ROOT_PATH)/llvm70.mk
include $(LLVM70_ROOT_PATH)/shared_llvm70.mk
include $(addprefix $(LLVM70_ROOT_PATH)/,$(addsuffix /Android.mk, $(subdirs)))
