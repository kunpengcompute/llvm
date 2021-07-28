LOCAL_PATH:= $(call my-dir)

vmcore_codegen_TBLGEN_TABLES := \
  AttributesCompatFunc.inc

vmcore_SRC_FILES :=       \
  AsmWriter.cpp           \
  Attributes.cpp          \
  AutoUpgrade.cpp         \
  BasicBlock.cpp          \
  Comdat.cpp              \
  ConstantFold.cpp        \
  ConstantRange.cpp       \
  Constants.cpp           \
  Core.cpp                \
  DIBuilder.cpp           \
  DataLayout.cpp          \
  DebugInfo.cpp           \
  DebugInfoMetadata.cpp   \
  DebugLoc.cpp            \
  DiagnosticHandler.cpp   \
  DiagnosticInfo.cpp      \
  DiagnosticPrinter.cpp   \
  Dominators.cpp          \
  DomTreeUpdater.cpp      \
  Function.cpp            \
  GVMaterializer.cpp      \
  Globals.cpp             \
  IRBuilder.cpp           \
  IRPrintingPasses.cpp    \
  InlineAsm.cpp           \
  Instruction.cpp         \
  Instructions.cpp        \
  IntrinsicInst.cpp       \
  LLVMContext.cpp         \
  LLVMContextImpl.cpp     \
  LegacyPassManager.cpp   \
  MDBuilder.cpp           \
  Mangler.cpp             \
  Metadata.cpp            \
  Module.cpp              \
  ModuleSummaryIndex.cpp  \
  Operator.cpp            \
  OptBisect.cpp           \
  Pass.cpp                \
  PassInstrumentation.cpp \
  PassManager.cpp         \
  PassRegistry.cpp        \
  PassTimingInfo.cpp      \
  SafepointIRVerifier.cpp \
  ProfileSummary.cpp      \
  Statepoint.cpp          \
  Type.cpp                \
  TypeFinder.cpp          \
  Use.cpp                 \
  User.cpp                \
  Value.cpp               \
  ValueSymbolTable.cpp    \
  Verifier.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(vmcore_SRC_FILES)

LOCAL_MODULE:= libLLVM70Core

LOCAL_MODULE_HOST_OS := linux

TBLGEN_TABLES := $(vmcore_codegen_TBLGEN_TABLES)
TBLGEN_IN_TD := AttributesCompatFunc.td

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

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(vmcore_SRC_FILES)

LOCAL_MODULE:= libLLVM70Core
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_EXPORT_C_INCLUDE_DIRS := $(call local-generated-sources-dir)

TBLGEN_TABLES := $(vmcore_codegen_TBLGEN_TABLES)
TBLGEN_IN_TD := AttributesCompatFunc.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
