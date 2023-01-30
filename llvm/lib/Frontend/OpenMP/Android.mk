LOCAL_PATH:= $(call my-dir)

openmp_TBLGEN_TABLES :=   \
  llvm/Frontend/OpenMP/OMP.h.inc \
  OMP.cpp

openmp_SRC_FILES :=       \
  OMPContext.cpp \
  OMPIRBuilder.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(openmp_SRC_FILES)
LOCAL_MODULE:= libLLVM70OpenMp

LOCAL_MODULE_HOST_OS := linux

TBLGEN_TD_DIR := $(LLVM70_ROOT_PATH)/include/llvm/Frontend/OpenMP
TBLGEN_TABLES := $(openmp_TBLGEN_TABLES)
TBLGEN_IN_TD := OMP.td

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS)

LOCAL_SRC_FILES := $(openmp_SRC_FILES)
LOCAL_MODULE:= libLLVM70OpenMp

TBLGEN_TD_DIR := $(LLVM70_ROOT_PATH)/include/llvm/Frontend/OpenMP
TBLGEN_TABLES := $(openmp_TBLGEN_TABLES)
TBLGEN_IN_TD := OMP.td

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif