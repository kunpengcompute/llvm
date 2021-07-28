LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM70_ROOT_PATH)/llvm70.mk

bugpoint70_passes_SRC_FILES := \
  TestPasses.cpp

# BugpointPasses module for the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(bugpoint70_passes_SRC_FILES)
LOCAL_MODULE := BugpointPasses70

LOCAL_MODULE_CLASS := SHARED_LIBRARIES # needed for tblgen
LOCAL_LDFLAGS_darwin := -Wl,-undefined -Wl,dynamic_lookup

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
