LOCAL_PATH:= $(call my-dir)

Remarks_SRC_FILES := \
  BitstreamRemarkParser.cpp \
  BitstreamRemarkSerializer.cpp \
  Remark.cpp \
  RemarkFormat.cpp \
  RemarkLinker.cpp \
  RemarkParser.cpp \
  RemarkSerializer.cpp \
  RemarkStreamer.cpp \
  RemarkStringTable.cpp \
  YAMLRemarkParser.cpp \
  YAMLRemarkSerializer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

# LOCAL_WHOLE_STATIC_LIBRARIES:= libLLVM70BitstreamReader

LOCAL_SRC_FILES := $(Remarks_SRC_FILES)

LOCAL_MODULE:= libLLVM70Remarks

LOCAL_MODULE_HOST_OS := darwin linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(Remarks_SRC_FILES)

LOCAL_MODULE:= libLLVM70Remarks

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
