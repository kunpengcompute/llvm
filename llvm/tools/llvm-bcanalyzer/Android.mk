LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-bcanalyzer command line tool
#===---------------------------------------------------------------===

llvm70_bcanalyzer_SRC_FILES := \
  llvm-bcanalyzer.cpp

llvm70_bcanalyzer_STATIC_LIBRARIES := \
  libLLVM70BitReader                  \
  libLLVM70Core                       \
  libLLVM70Support                    \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm70-bcanalyzer
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm70_bcanalyzer_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm70_bcanalyzer_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_C_INCLUDES += external/llvm/include

include $(LLVM70_ROOT_PATH)/llvm70.mk
include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
