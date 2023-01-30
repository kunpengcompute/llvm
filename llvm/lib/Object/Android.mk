LOCAL_PATH := $(call my-dir)

object_SRC_FILES :=        \
  Archive.cpp \
  ArchiveWriter.cpp \
  Binary.cpp \
  COFFImportFile.cpp \
  COFFModuleDefinition.cpp \
  COFFObjectFile.cpp \
  Decompressor.cpp \
  ELF.cpp \
  ELFObjectFile.cpp \
  Error.cpp \
  IRObjectFile.cpp \
  IRSymtab.cpp \
  MachOObjectFile.cpp \
  MachOUniversal.cpp \
  Minidump.cpp \
  ModuleSymbolTable.cpp \
  Object.cpp \
  ObjectFile.cpp \
  RecordStreamer.cpp \
  RelocationResolver.cpp \
  SymbolicFile.cpp \
  SymbolSize.cpp \
  TapiFile.cpp \
  TapiUniversal.cpp \
  WasmObjectFile.cpp \
  WindowsMachineFlag.cpp \
  WindowsResource.cpp \
  XCOFFObjectFile.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70Object
LOCAL_MODULE_HOST_OS := linux

LOCAL_SRC_FILES := $(object_SRC_FILES)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70Object

LOCAL_SRC_FILES := $(object_SRC_FILES)

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
