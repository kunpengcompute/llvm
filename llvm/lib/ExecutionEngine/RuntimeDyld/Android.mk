LOCAL_PATH:= $(call my-dir)

runtimedyld_SRC_FILES :=  \
  JITSymbol.cpp           \
  RTDyldMemoryManager.cpp \
  RuntimeDyldChecker.cpp  \
  RuntimeDyldCOFF.cpp     \
  RuntimeDyld.cpp         \
  RuntimeDyldELF.cpp      \
  RuntimeDyldMachO.cpp    \
  Targets/RuntimeDyldELFMips.cpp


# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(runtimedyld_SRC_FILES)
LOCAL_MODULE := libLLVM70RuntimeDyld

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(runtimedyld_SRC_FILES)
LOCAL_MODULE := libLLVM70RuntimeDyld

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
