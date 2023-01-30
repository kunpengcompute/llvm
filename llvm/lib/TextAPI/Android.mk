LOCAL_PATH:= $(call my-dir)

text_api_SRC_FILES := \
  MachO/Architecture.cpp  \
  MachO/ArchitectureSet.cpp  \
  MachO/InterfaceFile.cpp  \
  MachO/PackedVersion.cpp  \
  MachO/Platform.cpp  \
  MachO/Symbol.cpp  \
  MachO/Target.cpp  \
  MachO/TextStub.cpp  \
  MachO/TextStubCommon.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(text_api_SRC_FILES)

LOCAL_MODULE:= libLLVM70TextApi

LOCAL_MODULE_HOST_OS := darwin linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(text_api_SRC_FILES)

LOCAL_MODULE:= libLLVM70TextApi

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
