LOCAL_PATH:= $(call my-dir)

orcjit_SRC_LIBS := 
  

orcjit_SRC_FILES :=            \
  CompileOnDemandLayer.cpp \
  CompileUtils.cpp \
  Core.cpp \
  DebugUtils.cpp \
  ExecutionUtils.cpp \
  IndirectionUtils.cpp \
  IRCompileLayer.cpp \
  IRTransformLayer.cpp \
  JITTargetMachineBuilder.cpp \
  LazyReexports.cpp \
  Layer.cpp \
  LLJIT.cpp \
  MachOPlatform.cpp \
  Mangling.cpp \
  ObjectLinkingLayer.cpp \
  ObjectTransformLayer.cpp \
  OrcABISupport.cpp \
  OrcV2CBindings.cpp \
  RTDyldObjectLinkingLayer.cpp \
  Speculation.cpp \
  SpeculateAnalyses.cpp \
  TargetProcessControl.cpp \
  ThreadSafeModule.cpp \
  TPCDynamicLibrarySearchGenerator.cpp \
  TPCEHFrameRegistrar.cpp \
  TPCIndirectionUtils.cpp \
  Shared/OrcError.cpp \
  Shared/RPCError.cpp \
  Shared/TargetProcessControlTypes.cpp \
  TargetProcess/RegisterEHFrames.cpp \
  TargetProcess/TargetExecutionUtils.cpp
  

  # TargetProcess/RegisterEHFrames.cpp 
  # TargetProcess/TargetExecutionUtils.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_LDLIBS_darwin := -ldl -lpthread
LOCAL_LDLIBS_linux := -ldl -lpthread

LOCAL_SRC_FILES := $(orcjit_SRC_FILES)
LOCAL_MODULE := libLLVM70OrcJIT

LOCAL_MODULE_HOST_OS :=  darwin linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_LDLIBS_darwin := -ldl -lpthread
LOCAL_LDLIBS_linux := -ldl -lpthread

LOCAL_SRC_FILES := $(orcjit_SRC_FILES)
LOCAL_MODULE := libLLVM70OrcJIT

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
