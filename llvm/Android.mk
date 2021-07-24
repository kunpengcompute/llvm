LOCAL_PATH := $(call my-dir)
LLVM70_ROOT_PATH := $(LOCAL_PATH)
LLVM_ANDROID_MAJOR_VERSION := $(word 1, $(subst ., , $(PLATFORM_VERSION)))
ifeq ($(LLVM_ANDROID_MAJOR_VERSION), 7)
    include $(LLVM70_ROOT_PATH)/definitions.mk
endif

define _add-clean-step
  $(if $(strip $(INTERNAL_CLEAN_BUILD_VERSION)),, \
      $(error INTERNAL_CLEAN_BUILD_VERSION not set))
  $(eval _acs_makefile_prefix := $(lastword $(MAKEFILE_LIST)))
  $(eval _acs_makefile_prefix := $(subst /,_,$(_acs_makefile_prefix)))
  $(eval _acs_makefile_prefix := $(subst .,-,$(_acs_makefile_prefix)))
  $(eval _acs_makefile_prefix := $(_acs_makefile_prefix)_acs)
  $(if $($(_acs_makefile_prefix)),,\
      $(eval $(_acs_makefile_prefix) := $(INTERNAL_CLEAN_BUILD_VERSION)))
  $(eval $(_acs_makefile_prefix) := $($(_acs_makefile_prefix))@)
  $(if $(strip $(2)),$(eval _acs_id := $($(_acs_makefile_prefix))),\
      $(eval _acs_id := $(_acs_makefile_prefix)$($(_acs_makefile_prefix))))
  $(eval INTERNAL_CLEAN_STEPS += $(_acs_id))
  $(eval INTERNAL_CLEAN_STEP.$(_acs_id) := $(1))
  $(eval _acs_id :=)
  $(eval _acs_makefile_prefix :=)
endef
define add-clean-step
$(eval # for build/core/cleanspec.mk, dont use makefile path as part of step id) \
$(if $(filter %/cleanspec.mk,$(lastword $(MAKEFILE_LIST))),\
    $(eval $(call _add-clean-step,$(1),true)),\
    $(eval $(call _add-clean-step,$(1))))
endef

LLVM70_TBLGEN := $(BUILD_OUT_EXECUTABLES)/llvm70-tblgen$(BUILD_EXECUTABLE_SUFFIX)
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

# LLVM70 Command Line Utilities
subdirs += \
  utils/TableGen

include $(LLVM70_ROOT_PATH)/llvm70.mk
include $(LLVM70_ROOT_PATH)/shared_llvm70.mk
include $(addprefix $(LLVM70_ROOT_PATH)/,$(addsuffix /Android.mk, $(subdirs)))
