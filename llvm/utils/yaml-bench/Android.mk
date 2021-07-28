LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


yaml70_bench_SRC_FILES := \
  YAMLBench.cpp

yaml70_bench_STATIC_LIBRARIES := \
  libLLVM70Support \

# yaml-bench executable for the host
# =====================================================

include $(CLEAR_VARS)

LOCAL_MODULE := yaml70-bench
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(yaml70_bench_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(yaml70_bench_STATIC_LIBRARIES)

include $(LLVM70_ROOT_PATH)/llvm70.mk
include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
