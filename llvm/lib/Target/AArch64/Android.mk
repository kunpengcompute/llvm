LOCAL_PATH := $(call my-dir)

aarch64_codegen_TBLGEN_TABLES :=   \
  AArch64GenRegisterInfo.inc       \
  AArch64GenInstrInfo.inc          \
  AArch64GenAsmWriter.inc          \
  AArch64GenAsmWriter1.inc         \
  AArch64GenDAGISel.inc            \
  AArch64GenCallingConv.inc        \
  AArch64GenAsmMatcher.inc         \
  AArch64GenSubtargetInfo.inc      \
  AArch64GenMCCodeEmitter.inc      \
  AArch64GenFastISel.inc           \
  AArch64GenDisassemblerTables.inc \
  AArch64GenMCPseudoLowering.inc   \
  AArch64GenSystemOperands.inc     \
  AArch64GenRegisterBank.inc       \
  AArch64GenGlobalISel.inc         \
  AArch64GenExegesis.inc

aarch64_codegen_SRC_FILES :=             \
  AArch64A57FPLoadBalancing.cpp          \
  AArch64AdvSIMDScalarPass.cpp           \
  AArch64AsmPrinter.cpp                  \
  AArch64BranchTargets.cpp               \
  AArch64CallLowering.cpp                \
  AArch64CleanupLocalDynamicTLSPass.cpp  \
  AArch64CollectLOH.cpp                  \
  AArch64CondBrTuning.cpp                \
  AArch64ConditionalCompares.cpp         \
  AArch64DeadRegisterDefinitionsPass.cpp \
  AArch64ExpandPseudoInsts.cpp           \
  AArch64FalkorHWPFFix.cpp               \
  AArch64FastISel.cpp                    \
  AArch64A53Fix835769.cpp                \
  AArch64FrameLowering.cpp               \
  AArch64CompressJumpTables.cpp          \
  AArch64ConditionOptimizer.cpp          \
  AArch64RedundantCopyElimination.cpp    \
  AArch64ISelDAGToDAG.cpp                \
  AArch64ISelLowering.cpp                \
  AArch64PreLegalizerCombiner.cpp        \
  AArch64InstrInfo.cpp                   \
  AArch64InstructionSelector.cpp         \
  AArch64LegalizerInfo.cpp               \
  AArch64LoadStoreOptimizer.cpp          \
  AArch64MacroFusion.cpp                 \
  AArch64MCInstLower.cpp                 \
  AArch64PromoteConstant.cpp             \
  AArch64PBQPRegAlloc.cpp                \
  AArch64RegisterBankInfo.cpp            \
  AArch64RegisterInfo.cpp                \
  AArch64SelectionDAGInfo.cpp            \
  AArch64SpeculationHardening.cpp        \
  AArch64StorePairSuppress.cpp           \
  AArch64Subtarget.cpp                   \
  AArch64TargetMachine.cpp               \
  AArch64TargetObjectFile.cpp            \
  AArch64TargetTransformInfo.cpp         \
  AArch64SIMDInstrOpt.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70AArch64CodeGen
LOCAL_MODULE_HOST_OS := linux

LOCAL_SRC_FILES := $(aarch64_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
LOCAL_EXPORT_C_INCLUDE_DIRS := .

TBLGEN_TABLES := $(aarch64_codegen_TBLGEN_TABLES)
TBLGEN_IN_TD := AArch64.td

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70AArch64CodeGen

LOCAL_SRC_FILES := $(aarch64_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
LOCAL_EXPORT_C_INCLUDE_DIRS := .

TBLGEN_TABLES := $(aarch64_codegen_TBLGEN_TABLES)
TBLGEN_IN_TD := AArch64.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
