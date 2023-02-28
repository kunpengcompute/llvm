LOCAL_PATH:= $(call my-dir)

llvm70_as_SRC_FILES := \
  llvm-as.cpp

include $(CLEAR_VARS)

LOCAL_MODULE := llvm70-as
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm70_as_SRC_FILES)
LOCAL_LDLIBS += -lm
LOCAL_LDLIBS_windows := -limagehlp
LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := \
  libLLVM70AsmParser \
  libLLVM70BitWriter \
  libLLVM70BitstreamReader \
  libLLVM70Core \
  libLLVM70Support \
  libLLVM70MIRParser \
  libLLVM70JITLink \
  libLLVM70Coroutines \
  libLLVM70CFGuard

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)
