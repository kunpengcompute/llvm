LOCAL_PATH := $(call my-dir)

arm_codegen_TBLGEN_TABLES :=   \
  ARMGenAsmMatcher.inc         \
  ARMGenAsmWriter.inc          \
  ARMGenCallingConv.inc        \
  ARMGenDAGISel.inc            \
  ARMGenDisassemblerTables.inc \
  ARMGenFastISel.inc           \
  ARMGenGlobalISel.inc         \
  ARMGenInstrInfo.inc          \
  ARMGenMCCodeEmitter.inc      \
  ARMGenMCPseudoLowering.inc   \
  ARMGenRegisterBank.inc       \
  ARMGenRegisterInfo.inc       \
  ARMGenSubtargetInfo.inc      \
  ARMGenSystemRegister.inc

arm_codegen_SRC_FILES :=      \
  A15SDOptimizer.cpp \
  ARMAsmPrinter.cpp \
  ARMBaseInstrInfo.cpp \
  ARMBaseRegisterInfo.cpp \
  ARMBasicBlockInfo.cpp \
  ARMCallingConv.cpp \
  ARMCallLowering.cpp \
  ARMConstantIslandPass.cpp \
  ARMConstantPoolValue.cpp \
  ARMExpandPseudoInsts.cpp \
  ARMFastISel.cpp \
  ARMFrameLowering.cpp \
  ARMHazardRecognizer.cpp \
  ARMInstructionSelector.cpp \
  ARMISelDAGToDAG.cpp \
  ARMISelLowering.cpp \
  ARMInstrInfo.cpp \
  ARMLegalizerInfo.cpp \
  ARMParallelDSP.cpp \
  ARMLoadStoreOptimizer.cpp \
  ARMLowOverheadLoops.cpp \
  ARMBlockPlacement.cpp \
  ARMMCInstLower.cpp \
  ARMMachineFunctionInfo.cpp \
  ARMMacroFusion.cpp \
  ARMRegisterInfo.cpp \
  ARMOptimizeBarriersPass.cpp \
  ARMRegisterBankInfo.cpp \
  ARMSelectionDAGInfo.cpp \
  ARMSLSHardening.cpp \
  ARMSubtarget.cpp \
  ARMTargetMachine.cpp \
  ARMTargetObjectFile.cpp \
  ARMTargetTransformInfo.cpp \
  MLxExpansionPass.cpp \
  MVEGatherScatterLowering.cpp \
  MVETailPredication.cpp \
  MVEVPTBlockPass.cpp \
  MVEVPTOptimisationsPass.cpp \
  Thumb1FrameLowering.cpp \
  Thumb1InstrInfo.cpp \
  ThumbRegisterInfo.cpp \
  Thumb2ITBlockPass.cpp \
  Thumb2InstrInfo.cpp \
  Thumb2SizeReduction.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70ARMCodeGen
LOCAL_MODULE_HOST_OS := linux

LOCAL_SRC_FILES := $(arm_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
LOCAL_EXPORT_C_INCLUDE_DIRS := .

TBLGEN_TABLES := $(arm_codegen_TBLGEN_TABLES)
TBLGEN_IN_TD := ARM.td
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

LOCAL_MODULE:= libLLVM70ARMCodeGen

LOCAL_SRC_FILES := $(arm_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
LOCAL_EXPORT_C_INCLUDE_DIRS := .

TBLGEN_TABLES := $(arm_codegen_TBLGEN_TABLES)
TBLGEN_IN_TD := ARM.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
