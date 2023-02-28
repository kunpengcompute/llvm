LOCAL_PATH:= $(call my-dir)

profiledata_coverage_SRC_FILES := \
  CoverageMapping.cpp             \
  CoverageMappingReader.cpp       \
  CoverageMappingWriter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70ProfileDataCoverage
LOCAL_MODULE_HOST_OS := linux
LOCAL_SRC_FILES := $(profiledata_coverage_SRC_FILES)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70ProfileDataCoverage
LOCAL_SRC_FILES := $(profiledata_coverage_SRC_FILES)

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
