LOCAL_PATH:= $(call my-dir)

llvm70_pre_static_libraries := \
  libLLVM70Linker \
  libLLVM70ipo \
  libLLVM70DebugInfoDWARF \
  libLLVM70DebugInfoPDB \
  libLLVM70DebugInfoMSF \
  libLLVM70Symbolize \
  libLLVM70IRReader \
  libLLVM70BitWriter \
  libLLVM70BitReader \
  libLLVM70Passes \
  libLLVM70Demangle

llvm70_arm_static_libraries := \
  libLLVM70ARMCodeGen \
  libLLVM70ARMAsmParser \
  libLLVM70ARMAsmPrinter \
  libLLVM70ARMInfo \
  libLLVM70ARMDesc \
  libLLVM70ARMDisassembler \
  libLLVM70ARMUtils

llvm70_x86_static_libraries := \
  libLLVM70X86CodeGen \
  libLLVM70X86Info \
  libLLVM70X86Desc \
  libLLVM70X86AsmParser \
  libLLVM70X86AsmPrinter \
  libLLVM70X86Utils \
  libLLVM70X86Disassembler

llvm70_amdgpu_static_libraries := \
  libLLVM70AMDGPUCodeGen \
  libLLVM70AMDGPUInfo \
  libLLVM70AMDGPUDesc \
  libLLVM70AMDGPUAsmParser \
  libLLVM70AMDGPUDisassembler \
  libLLVM70AMDGPUAsmPrinter \
  libLLVM70AMDGPUUtils

llvm70_aarch64_static_libraries := \
  libLLVM70AArch64CodeGen \
  libLLVM70AArch64Info \
  libLLVM70AArch64Desc \
  libLLVM70AArch64AsmParser \
  libLLVM70AArch64AsmPrinter \
  libLLVM70AArch64Utils \
  libLLVM70AArch64Disassembler

llvm70_post_static_libraries :=  \
  libLLVM70LTO                   \
  libLLVM70AsmPrinter            \
  libLLVM70SelectionDAG          \
  libLLVM70CodeGen               \
  libLLVM70DebugInfoCodeView     \
  libLLVM70Object                \
  libLLVM70ScalarOpts            \
  libLLVM70AggressiveInstCombine \
  libLLVM70InstCombine           \
  libLLVM70Instrumentation       \
  libLLVM70TransformObjCARC      \
  libLLVM70TransformUtils        \
  libLLVM70Analysis              \
  libLLVM70Target                \
  libLLVM70GlobalISel            \
  libLLVM70MCDisassembler        \
  libLLVM70MC                    \
  libLLVM70MCParser              \
  libLLVM70Core                  \
  libLLVM70AsmParser             \
  libLLVM70Option                \
  libLLVM70Support               \
  libLLVM70Vectorize             \
  libLLVM70ProfileData           \
  libLLVM70ProfileDataCoverage   \
  libLLVM70LibDriver             \
  libLLVM70ExecutionEngine       \
  libLLVM70RuntimeDyld           \
  libLLVM70MCJIT                 \
  libLLVM70OrcJIT                \
  libLLVM70BinaryFormat

# HOST LLVM70 shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM70

LOCAL_MODULE_TAGS := optional

# Host build pulls in all ARM, Mips, X86 components.
LOCAL_WHOLE_STATIC_LIBRARIES := \
  $(llvm70_pre_static_libraries) \
  $(llvm70_arm_static_libraries) \
  $(llvm70_x86_static_libraries) \
  $(llvm70_aarch64_static_libraries) \
  $(llvm70_post_static_libraries)

LOCAL_LDLIBS_darwin := -ldl -lpthread
LOCAL_LDLIBS_linux := -ldl -lpthread

LOCAL_MODULE_HOST_OS := linux

LOCAL_EXPORT_C_INCLUDE_DIRS :=     \
  $(LLVM70_ROOT_PATH)/include      \
  $(LLVM70_ROOT_PATH)/host/include \
  $(call intermediates-dir-for,STATIC_LIBRARIES,libLLVM70Core,$(LOCAL_IS_HOST_MODULE),,,)

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM70_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm70 build)
endif

ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
# DEVICE LLVM70 shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70

LOCAL_MODULE_TAGS := optional

# Device build selectively pulls in ARM, X86 components.
LOCAL_WHOLE_STATIC_LIBRARIES := \
  $(llvm70_pre_static_libraries) \
  $(llvm70_amdgpu_static_libraries)

LOCAL_WHOLE_STATIC_LIBRARIES_arm += $(llvm70_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm70_x86_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm70_x86_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_arm64 += $(llvm70_aarch64_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_arm64 += $(llvm70_arm_static_libraries)

ifeq ($(BUILD_ARM_FOR_X86),true)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm70_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm70_aarch64_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm70_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm70_aarch64_static_libraries)
endif

LOCAL_WHOLE_STATIC_LIBRARIES += \
  $(llvm70_post_static_libraries)

LOCAL_EXPORT_C_INCLUDE_DIRS :=       \
  $(LLVM70_ROOT_PATH)/include        \
  $(LLVM70_ROOT_PATH)/device/include \
  $(call intermediates-dir-for,STATIC_LIBRARIES,libLLVM70Core,$(LOCAL_IS_HOST_MODULE),,,)

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_SHARED_LIBRARY)

endif
