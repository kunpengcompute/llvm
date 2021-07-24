LOCAL_PATH := $(call my-dir)

amdgpu_asm_disassembler_SRC_FILES := \
  AMDGPUDisassembler.cpp

#===---------------------------------------------------------------===
# libAMDGPUAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM70AMDGPUDisassembler
LOCAL_MODULE_HOST_OS := linux
LOCAL_SRC_FILES := $(amdgpu_asm_disassembler_SRC_FILES)
ifeq ($(LLVM_ANDROID_MAJOR_VERSION), 7)
    LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. \
        $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,,)
else
    LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. \
        $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,true,)
endif
LOCAL_STATIC_LIBRARIES += libLLVM70AMDGPUCodeGen
include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libAMDGPUAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM70_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := libLLVM70AMDGPUDisassembler
LOCAL_SRC_FILES := $(amdgpu_asm_disassembler_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. \
  $(call generated-sources-dir-for,STATIC_LIBRARIES,libLLVM70AMDGPUCodeGen,,)
LOCAL_STATIC_LIBRARIES += libLLVM70AMDGPUCodeGen
include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
