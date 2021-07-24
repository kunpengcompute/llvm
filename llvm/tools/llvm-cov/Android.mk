LOCAL_PATH := $(call my-dir)

LLVM70_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-cov command line tool
#===---------------------------------------------------------------===

llvm_cov_SRC_FILES :=        \
  llvm-cov.cpp               \
  gcov.cpp                   \
  CodeCoverage.cpp           \
  CoverageExporterJson.cpp   \
  CoverageFilters.cpp        \
  CoverageReport.cpp         \
  CoverageSummaryInfo.cpp    \
  SourceCoverageView.cpp     \
  SourceCoverageViewHTML.cpp \
  SourceCoverageViewText.cpp \
  TestingSupport.cpp

llvm_cov_STATIC_LIBRARIES :=   \
  libLLVM70Object              \
  libLLVM70ProfileData         \
  libLLVM70MC                  \
  libLLVM70MCParser            \
  libLLVM70BitReader           \
  libLLVM70Core                \
  libLLVM70Support             \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm70-cov
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm70_cov_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm70_cov_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM70_ROOT_PATH)/llvm70.mk
include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
