LOCAL_PATH:= $(call my-dir)

debuginfo_dwarf_SRC_FILES :=       \
  DWARFAbbreviationDeclaration.cpp \
  DWARFAcceleratorTable.cpp \
  DWARFAddressRange.cpp \
  DWARFCompileUnit.cpp \
  DWARFContext.cpp \
  DWARFDataExtractor.cpp \
  DWARFDebugAbbrev.cpp \
  DWARFDebugAddr.cpp \
  DWARFDebugAranges.cpp \
  DWARFDebugArangeSet.cpp \
  DWARFDebugFrame.cpp \
  DWARFDebugInfoEntry.cpp \
  DWARFDebugLine.cpp \
  DWARFDebugLoc.cpp \
  DWARFDebugMacro.cpp \
  DWARFDebugPubTable.cpp \
  DWARFDebugRangeList.cpp \
  DWARFDebugRnglists.cpp \
  DWARFDie.cpp \
  DWARFExpression.cpp \
  DWARFFormValue.cpp \
  DWARFGdbIndex.cpp \
  DWARFListTable.cpp \
  DWARFTypeUnit.cpp \
  DWARFUnit.cpp \
  DWARFUnitIndex.cpp \
  DWARFVerifier.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_dwarf_SRC_FILES)

LOCAL_MODULE:= libLLVM70DebugInfoDWARF

LOCAL_MODULE_HOST_OS := darwin linux

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_dwarf_SRC_FILES)

LOCAL_MODULE:= libLLVM70DebugInfoDWARF

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
