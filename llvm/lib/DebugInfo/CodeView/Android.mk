LOCAL_PATH:= $(call my-dir)

debuginfo_codeview_SRC_FILES :=   \
  AppendingTypeTableBuilder.cpp   \
  CodeViewError.cpp               \
  CodeViewRecordIO.cpp            \
  ContinuationRecordBuilder.cpp   \
  CVSymbolVisitor.cpp             \
  CVTypeVisitor.cpp               \
  DebugChecksumsSubsection.cpp    \
  DebugCrossExSubsection.cpp      \
  DebugCrossImpSubsection.cpp     \
  DebugFrameDataSubsection.cpp    \
  DebugInlineeLinesSubsection.cpp \
  DebugLinesSubsection.cpp        \
  DebugStringTableSubsection.cpp  \
  DebugSubsection.cpp             \
  DebugSubsectionRecord.cpp       \
  DebugSubsectionVisitor.cpp      \
  DebugSymbolRVASubsection.cpp    \
  DebugSymbolsSubsection.cpp      \
  EnumTables.cpp                  \
  Formatters.cpp                  \
  GlobalTypeTableBuilder.cpp      \
  LazyRandomTypeCollection.cpp    \
  Line.cpp                        \
  MergingTypeTableBuilder.cpp     \
  RecordName.cpp                  \
  RecordSerialization.cpp         \
  SimpleTypeSerializer.cpp        \
  StringsAndChecksums.cpp         \
  SymbolDumper.cpp                \
  SymbolRecordHelpers.cpp         \
  SymbolRecordMapping.cpp         \
  SymbolSerializer.cpp            \
  TypeDumpVisitor.cpp             \
  TypeHashing.cpp                 \
  TypeRecordHelpers.cpp           \
  TypeIndex.cpp                   \
  TypeIndexDiscovery.cpp          \
  TypeRecordMapping.cpp           \
  TypeStreamMerger.cpp            \
  TypeTableCollection.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(debuginfo_codeview_SRC_FILES)

LOCAL_MODULE:= libLLVM70DebugInfoCodeView

LOCAL_MODULE_HOST_OS := linux

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(debuginfo_codeview_SRC_FILES)

LOCAL_MODULE:= libLLVM70DebugInfoCodeView

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
