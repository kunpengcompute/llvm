LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-ar command line tool
#===---------------------------------------------------------------===

llvm70_ar_SRC_FILES := \
  llvm-ar.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := llvm70-ar
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm70_ar_SRC_FILES)

LOCAL_SHARED_LIBRARIES := libLLVM70

LOCAL_LDLIBS += -lpthread -lm -ldl

# Create symlink llvm-lib and llvm-ranlib pointing to llvm-ar.
# Use "=" (instead of ":=") to defer the evaluation.
LOCAL_POST_INSTALL_CMD = $(hide) ln -sf llvm70-ar $(dir $(LOCAL_INSTALLED_MODULE))llvm70-lib \
						 && ln -sf llvm70-ar $(dir $(LOCAL_INSTALLED_MODULE))llvm70-ranlib

include $(LLVM70_ROOT_PATH)/llvm70.mk
include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)
