LOCAL_PATH:= $(call my-dir)

orcjit_SRC_FILES :=            \
  CompileOnDemandLayer.cpp     \
  Core.cpp                     \
  ExecutionUtils.cpp           \
  IndirectionUtils.cpp         \
  IRCompileLayer.cpp           \
  IRTransformLayer.cpp         \
  JITTargetMachineBuilder.cpp  \
  LazyReexports.cpp            \
  Legacy.cpp                   \
  Layer.cpp                    \
  LLJIT.cpp                    \
  NullResolver.cpp             \
  ObjectTransformLayer.cpp     \
  OrcABISupport.cpp            \
  OrcCBindings.cpp             \
  OrcError.cpp                 \
  OrcMCJITReplacement.cpp      \
  RPCUtils.cpp                 \
  RTDyldObjectLinkingLayer.cpp \
  ThreadSafeModule.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(orcjit_SRC_FILES)
LOCAL_MODULE := libLLVM70OrcJIT

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(orcjit_SRC_FILES)
LOCAL_MODULE := libLLVM70OrcJIT

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
