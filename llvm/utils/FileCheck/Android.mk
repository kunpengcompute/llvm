LOCAL_PATH:= $(call my-dir)

filecheck70_SRC_FILES := \
  FileCheck.cpp

filecheck70_STATIC_LIBRARIES := \
  libLLVM70Support

include $(CLEAR_VARS)

LOCAL_MODULE := FileCheck70
LOCAL_SRC_FILES := $(filecheck_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(filecheck70_STATIC_LIBRARIES)
LOCAL_C_INCLUDES += external/llvm/host/include
LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_CFLAGS += -D __STDC_LIMIT_MACROS -D __STDC_CONSTANT_MACROS

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
