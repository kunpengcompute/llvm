LOCAL_PATH := $(call my-dir)

amdgpu_codegen_TBLGEN_TABLES :=   \
  AMDGPUGenAsmMatcher.inc         \
  AMDGPUGenAsmWriter.inc          \
  AMDGPUGenCallingConv.inc        \
  AMDGPUGenDAGISel.inc            \
  AMDGPUGenDisassemblerTables.inc \
  AMDGPUGenInstrInfo.inc          \
  AMDGPUGenIntrinsicEnums.inc     \
  AMDGPUGenIntrinsicImpl.inc      \
  AMDGPUGenMCCodeEmitter.inc      \
  AMDGPUGenMCPseudoLowering.inc   \
  AMDGPUGenRegisterBank.inc       \
  AMDGPUGenRegisterInfo.inc       \
  AMDGPUGenSearchableTables.inc   \
  AMDGPUGenSubtargetInfo.inc

amdgpu_codegen_1_TBLGEN_TABLES :=   \
  AMDGPUGenGlobalISel.inc

amdgpu_codegen_2_TBLGEN_TABLES :=   \
  R600GenAsmWriter.inc     \
  R600GenCallingConv.inc   \
  R600GenDAGISel.inc       \
  R600GenDFAPacketizer.inc \
  R600GenInstrInfo.inc     \
  R600GenMCCodeEmitter.inc \
  R600GenRegisterInfo.inc  \
  R600GenSubtargetInfo.inc

amdgpu_codegen_SRC_FILES :=              \
  AMDGPUAliasAnalysis.cpp                \
  AMDGPUAlwaysInlinePass.cpp             \
  AMDGPUAnnotateKernelFeatures.cpp       \
  AMDGPUAnnotateUniformValues.cpp        \
  AMDGPUArgumentUsageInfo.cpp            \
  AMDGPUAsmPrinter.cpp                   \
  AMDGPUAtomicOptimizer.cpp              \
  AMDGPUFixFunctionBitcasts.cpp          \
  SIAddIMGInit.cpp                       \
  SIFixupVectorISel.cpp                  \
  AMDGPUCallLowering.cpp                 \
  AMDGPUCodeGenPrepare.cpp               \
  AMDGPUFrameLowering.cpp                \
  AMDGPUHSAMetadataStreamer.cpp          \
  AMDGPUInstrInfo.cpp                    \
  AMDGPUInstructionSelector.cpp          \
  AMDGPUIntrinsicInfo.cpp                \
  AMDGPUISelDAGToDAG.cpp                 \
  AMDGPUISelLowering.cpp                 \
  AMDGPULegalizerInfo.cpp                \
  AMDGPULibCalls.cpp                     \
  AMDGPULibFunc.cpp                      \
  AMDGPULowerIntrinsics.cpp              \
  AMDGPULowerKernelArguments.cpp         \
  AMDGPULowerKernelAttributes.cpp        \
  AMDGPUMachineCFGStructurizer.cpp       \
  AMDGPUMachineFunction.cpp              \
  AMDGPUMachineModuleInfo.cpp            \
  AMDGPUMacroFusion.cpp                  \
  AMDGPUMCInstLower.cpp                  \
  AMDGPUOpenCLEnqueuedBlockLowering.cpp  \
  AMDGPUPromoteAlloca.cpp                \
  AMDGPURegAsmNames.inc.cpp              \
  AMDGPURegisterBankInfo.cpp             \
  AMDGPURegisterInfo.cpp                 \
  AMDGPURewriteOutArguments.cpp          \
  AMDGPUSubtarget.cpp                    \
  AMDGPUTargetMachine.cpp                \
  AMDGPUTargetObjectFile.cpp             \
  AMDGPUTargetTransformInfo.cpp          \
  AMDGPUUnifyDivergentExitNodes.cpp      \
  AMDGPUUnifyMetadata.cpp                \
  AMDGPUInline.cpp                       \
  AMDGPUPerfHintAnalysis.cpp             \
  AMDILCFGStructurizer.cpp               \
  GCNHazardRecognizer.cpp                \
  GCNIterativeScheduler.cpp              \
  GCNMinRegStrategy.cpp                  \
  GCNRegPressure.cpp                     \
  GCNSchedStrategy.cpp                   \
  R600AsmPrinter.cpp                     \
  R600ClauseMergePass.cpp                \
  R600ControlFlowFinalizer.cpp           \
  R600EmitClauseMarkers.cpp              \
  R600ExpandSpecialInstrs.cpp            \
  R600FrameLowering.cpp                  \
  R600InstrInfo.cpp                      \
  R600ISelLowering.cpp                   \
  R600MachineFunctionInfo.cpp            \
  R600MachineScheduler.cpp               \
  R600OpenCLImageTypeLoweringPass.cpp    \
  R600OptimizeVectorRegisters.cpp        \
  R600Packetizer.cpp                     \
  R600RegisterInfo.cpp                   \
  SIAnnotateControlFlow.cpp              \
  SIDebuggerInsertNops.cpp               \
  SIFixSGPRCopies.cpp                    \
  SIFixVGPRCopies.cpp                    \
  SIFixWWMLiveness.cpp                   \
  SIFoldOperands.cpp                     \
  SIFormMemoryClauses.cpp                \
  SIFrameLowering.cpp                    \
  SIInsertSkips.cpp                      \
  SIInsertWaitcnts.cpp                   \
  SIInstrInfo.cpp                        \
  SIISelLowering.cpp                     \
  SILoadStoreOptimizer.cpp               \
  SILowerControlFlow.cpp                 \
  SILowerI1Copies.cpp                    \
  SIMachineFunctionInfo.cpp              \
  SIMachineScheduler.cpp                 \
  SIMemoryLegalizer.cpp                  \
  SIOptimizeExecMasking.cpp              \
  SIOptimizeExecMaskingPreRA.cpp         \
  SIPeepholeSDWA.cpp                     \
  SIRegisterInfo.cpp                     \
  SIShrinkInstructions.cpp               \
  SIWholeQuadMode.cpp                    \
  GCNILPSched.cpp                        \
  GCNDPPCombine.cpp                      \
  SIModeRegister.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM70AMDGPUCodeGen
LOCAL_SRC_FILES := $(amdgpu_codegen_SRC_FILES)
LOCAL_EXPORT_C_INCLUDE_DIRS := .

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)

include $(CLEAR_TBLGEN_VARS)
TBLGEN_TABLES := $(amdgpu_codegen_TBLGEN_TABLES)
TBLGEN_IN_TD := AMDGPU.td
include $(LLVM70_TBLGEN_RULES_MK)

include $(CLEAR_TBLGEN_VARS)
TBLGEN_TABLES := $(amdgpu_codegen_1_TBLGEN_TABLES)
TBLGEN_IN_TD := AMDGPUGISel.td
include $(LLVM70_TBLGEN_RULES_MK)

include $(CLEAR_TBLGEN_VARS)
TBLGEN_TABLES := $(amdgpu_codegen_2_TBLGEN_TABLES)
TBLGEN_IN_TD := R600.td
include $(LLVM70_TBLGEN_RULES_MK)

include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(amdgpu_codegen_SRC_FILES)
LOCAL_EXPORT_C_INCLUDE_DIRS := .

LOCAL_MODULE := libLLVM70AMDGPUCodeGen

include $(LLVM70_DEVICE_BUILD_MK)

include $(CLEAR_TBLGEN_VARS)
TBLGEN_TABLES := $(amdgpu_codegen_TBLGEN_TABLES)
TBLGEN_IN_TD := AMDGPU.td
include $(LLVM70_TBLGEN_RULES_MK)

include $(CLEAR_TBLGEN_VARS)
TBLGEN_TABLES := $(amdgpu_codegen_1_TBLGEN_TABLES)
TBLGEN_IN_TD := AMDGPUGISel.td
include $(LLVM70_TBLGEN_RULES_MK)

include $(CLEAR_TBLGEN_VARS)
TBLGEN_TABLES := $(amdgpu_codegen_2_TBLGEN_TABLES)
TBLGEN_IN_TD := R600.td
include $(LLVM70_TBLGEN_RULES_MK)

include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
