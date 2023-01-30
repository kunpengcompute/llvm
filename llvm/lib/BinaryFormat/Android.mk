LOCAL_PATH:= $(call my-dir)

libbinaryformat_SRC_FILES := \
  AMDGPUMetadataVerifier.cpp \
  Dwarf.cpp \
  MachO.cpp \
  Magic.cpp \
  Minidump.cpp \
  MsgPackDocument.cpp \
  MsgPackDocumentYAML.cpp \
  MsgPackReader.cpp \
  MsgPackWriter.cpp \
  Wasm.cpp \
  XCOFF.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70BinaryFormat
LOCAL_MODULE_HOST_OS := linux
LOCAL_SRC_FILES := $(libbinaryformat_SRC_FILES)

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70BinaryFormat
LOCAL_SRC_FILES := $(libbinaryformat_SRC_FILES)

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
