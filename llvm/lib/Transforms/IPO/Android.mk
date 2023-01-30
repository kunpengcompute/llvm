LOCAL_PATH:= $(call my-dir)

transforms_ipo_TBLGEN_TABLES :=   \
  llvm/Frontend/OpenMP/OMP.h.inc \
  llvm/Frontend/OpenMP/OMP.cpp.inc

transforms_ipo_SRC_FILES :=      \
  AlwaysInliner.cpp              \
  Annotation2Metadata.cpp        \
  ArgumentPromotion.cpp          \
  Attributor.cpp                 \
  AttributorAttributes.cpp       \
  BarrierNoopPass.cpp            \
  BlockExtractor.cpp             \
  CalledValuePropagation.cpp     \
  ConstantMerge.cpp              \
  CrossDSOCFI.cpp                \
  DeadArgumentElimination.cpp    \
  ElimAvailExtern.cpp            \
  ExtractGV.cpp                  \
  ForceFunctionAttrs.cpp         \
  FunctionAttrs.cpp              \
  FunctionImport.cpp             \
  GlobalDCE.cpp                  \
  GlobalOpt.cpp                  \
  GlobalSplit.cpp                \
  HotColdSplitting.cpp           \
  IPO.cpp                        \
  IROutliner.cpp                 \
  InferFunctionAttrs.cpp         \
  InlineSimple.cpp               \
  Inliner.cpp                    \
  Internalize.cpp                \
  LoopExtractor.cpp              \
  LowerTypeTests.cpp             \
  MergeFunctions.cpp             \
  OpenMPOpt.cpp                  \
  PartialInlining.cpp            \
  PassManagerBuilder.cpp         \
  PruneEH.cpp                    \
  SampleContextTracker.cpp       \
  SampleProfile.cpp              \
  SampleProfileProbe.cpp         \
  SCCP.cpp                       \
  StripDeadPrototypes.cpp        \
  StripSymbols.cpp               \
  SyntheticCountsPropagation.cpp \
  ThinLTOBitcodeWriter.cpp       \
  WholeProgramDevirt.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_ipo_SRC_FILES)
LOCAL_MODULE:= libLLVM70ipo

TBLGEN_TD_DIR := $(LLVM70_ROOT_PATH)/include/llvm/Frontend/OpenMP
TBLGEN_TABLES := $(transforms_ipo_TBLGEN_TABLES)
TBLGEN_IN_TD := OMP.td

LOCAL_MODULE_HOST_OS := darwin linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_ipo_SRC_FILES)
LOCAL_MODULE:= libLLVM70ipo

TBLGEN_TD_DIR := $(LLVM70_ROOT_PATH)/include/llvm/Frontend/OpenMP
TBLGEN_TABLES := $(transforms_ipo_TBLGEN_TABLES)
TBLGEN_IN_TD := OMP.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
