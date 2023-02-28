# We treat Intrinsics.td as a very special target just like what lib/VMCore/Makefile does
INTRINSICTD := $(LLVM70_ROOT_PATH)/include/llvm/IR/Intrinsics.td
INTRINSICTDS := $(wildcard $(dir $(INTRINSICTD))/Intrinsics*.td)

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicEnums.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out,intrinsic-enums)
else
	$(call transform70-device-td-to-out,intrinsic-enums)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsARM.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=arm)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=arm)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsR600.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=r600)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=r600)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsAMDGPU.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=amdgcn)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=amdgcn)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsAArch64.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=aarch64)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=aarch64)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsWebAssembly.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=wasm)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=wasm)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsMips.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=mips)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=mips)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsX86.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=x86)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=x86)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsHexagon.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=hexagon)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=hexagon)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsNVPTX.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=nvvm)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=nvvm)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsPowerPC.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=ppc)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=ppc)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsS390.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=s390)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=s390)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsXCore.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=xcore)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=xcore)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsRISCV.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=riscv)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=riscv)
endif

# -gen-intrinsic-enums -intrinsic-prefix=bpf
GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsBPF.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=bpf)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=bpf)
endif

# tablegen(LLVM IntrinsicsVE.h -gen-intrinsic-enums -intrinsic-prefix=ve)
GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicsVE.h)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out2,intrinsic-enums,-intrinsic-prefix=ve)
else
	$(call transform70-device-td-to-out2,intrinsic-enums,-intrinsic-prefix=ve)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicImpl.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out,intrinsic-impl)
else
	$(call transform70-device-td-to-out,intrinsic-impl)
endif
