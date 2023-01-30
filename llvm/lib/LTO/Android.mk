LOCAL_PATH:= $(call my-dir)

lto_SRC_FILES :=           \
  Caching.cpp              \
  LTOBackend.cpp           \
  LTOCodeGenerator.cpp     \
  SummaryBasedOptimizations.cpp \
  LTO.cpp                  \
  LTOModule.cpp            \
  ThinLTOCodeGenerator.cpp \
  UpdateCompilerUsed.cpp


# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(lto_SRC_FILES)

LOCAL_MODULE:= libLLVM70LTO

LOCAL_MODULE_TAGS := optional

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(lto_SRC_FILES)

LOCAL_MODULE:= libLLVM70LTO

LOCAL_MODULE_TAGS := optional

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
