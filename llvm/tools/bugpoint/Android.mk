LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# bugpoint command line tool
#===---------------------------------------------------------------===

bugpoint70_SRC_FILES := \
  BugDriver.cpp       \
  CrashDebugger.cpp   \
  ExecutionDriver.cpp \
  ExtractFunction.cpp \
  FindBugs.cpp        \
  Miscompilation.cpp  \
  OptimizerDriver.cpp \
  ToolRunner.cpp      \
  bugpoint.cpp        \

bugpoint70_STATIC_LIBRARIES := \
  libLLVM70BitWriter \
  libLLVM70BitstreamReader \
  libLLVM70CodeGen \
  libLLVM70ipo \
  libLLVM70IRReader \
  libLLVM70BitReader \
  libLLVM70AsmParser \
  libLLVM70InstCombine \
  libLLVM70Instrumentation \
  libLLVM70Linker \
  libLLVM70TransformObjCARC \
  libLLVM70Object \
  libLLVM70ScalarOpts \
  libLLVM70TransformUtils \
  libLLVM70Analysis \
  libLLVM70TextApi \
  libLLVM70Target \
  libLLVM70Core \
  libLLVM70MC \
  libLLVM70MCParser \
  libLLVM70ProfileData \
  libLLVM70Vectorize \
  libLLVM70Support \
  libLLVM70Remarks \
  libLLVM70MIRParser \
  libLLVM70JITLink \
  libLLVM70Coroutines \
  libLLVM70CFGuard

include $(CLEAR_VARS)

LOCAL_MODULE := bugpoint70
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(bugpoint70_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(bugpoint70_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM70_ROOT_PATH)/llvm70.mk
include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
