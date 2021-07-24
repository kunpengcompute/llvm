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

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/IR/,IntrinsicImpl.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(INTRINSICTD) $(INTRINSICTDS) | $(LLVM70_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform70-host-td-to-out,intrinsic-impl)
else
	$(call transform70-device-td-to-out,intrinsic-impl)
endif
