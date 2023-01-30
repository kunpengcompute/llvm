LOCAL_PATH:= $(call my-dir)

libdriver_TBLGEN_TABLES := \
  Options.inc

libdriver_SRC_FILES := \
  LibDriver.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70LibDriver
LOCAL_MODULE_HOST_OS := darwin linux

LOCAL_SRC_FILES := $(libdriver_SRC_FILES)
TBLGEN_TABLES := $(libdriver_TBLGEN_TABLES)
TBLGEN_IN_TD := Options.td

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_MODULE:= libLLVM70LibDriver
LOCAL_SRC_FILES := $(libdriver_SRC_FILES)

TBLGEN_TABLES := $(libdriver_TBLGEN_TABLES)
TBLGEN_IN_TD := Options.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
