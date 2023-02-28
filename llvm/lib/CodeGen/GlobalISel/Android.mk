LOCAL_PATH := $(call my-dir)

codegen_asmprinter_SRC_FILES := \
  CSEInfo.cpp \
  GISelKnownBits.cpp \
  CSEMIRBuilder.cpp \
  CallLowering.cpp \
  GlobalISel.cpp \
  Combiner.cpp \
  CombinerHelper.cpp \
  GISelChangeObserver.cpp \
  IRTranslator.cpp \
  InlineAsmLowering.cpp \
  InstructionSelect.cpp \
  InstructionSelector.cpp \
  LegalityPredicates.cpp \
  LegalizeMutations.cpp \
  Legalizer.cpp \
  LegalizerHelper.cpp \
  LegalizerInfo.cpp \
  Localizer.cpp \
  LostDebugLocObserver.cpp \
  MachineIRBuilder.cpp \
  RegBankSelect.cpp \
  RegisterBank.cpp \
  RegisterBankInfo.cpp \
  Utils.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(codegen_asmprinter_SRC_FILES)
LOCAL_MODULE:= libLLVM70GlobalISel

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(codegen_asmprinter_SRC_FILES)
LOCAL_MODULE:= libLLVM70GlobalISel

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
