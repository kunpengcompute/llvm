###########################################################
## Commands for running tblgen to compile a td file
##########################################################
define transform70-td-to-out
$(if $(LOCAL_IS_HOST_MODULE),	\
	$(call transform70-host-td-to-out,$(1)),	\
	$(call transform70-device-td-to-out,$(1)))
endef

define transform70-td-to-out2
$(if $(LOCAL_IS_HOST_MODULE),	\
	$(call transform70-host-td-to-out2,$(1),$(2)),	\
	$(call transform70-device-td-to-out2,$(1),$(2)))
endef

###########################################################
## TableGen: Compile .td files to .inc.
###########################################################

# Set LOCAL_MODULE_CLASS to STATIC_LIBRARIES default (require
# for macro local-generated-sources-dir)
ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

ifneq ($(strip $(TBLGEN_TABLES)),)
generated_sources := $(call local-generated-sources-dir)
tblgen_gen_tables := $(addprefix $(generated_sources)/,$(TBLGEN_TABLES))
LOCAL_GENERATED_SOURCES += $(tblgen_gen_tables)

tblgen_source_dir := $(LOCAL_PATH)
ifneq ($(TBLGEN_TD_DIR),)
	tblgen_source_dir := $(TBLGEN_TD_DIR)
endif

tblgen_td_deps := $(tblgen_source_dir)/*.td
tblgen_td_deps := $(wildcard $(tblgen_td_deps))
#tblgen_td_deps :=

$(warning ======$(TBLGEN_IN_TD)====)
ifeq (R600.td,$(TBLGEN_IN_TD))

$(warning ======in R600.td====)
# rules for R600.td
ifneq ($(filter %R600GenAsmWriter.inc,$(tblgen_gen_tables)),)
$(warning "R600GenAsmWriter.inc")
$(generated_sources)/R600GenAsmWriter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/R600GenAsmWriter.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,asm-writer)
endif

ifneq ($(filter %R600GenCallingConv.inc,$(tblgen_gen_tables)),)
$(generated_sources)/R600GenCallingConv.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/R600GenCallingConv.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,callingconv)
endif

ifneq ($(filter %R600GenDAGISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/R600GenDAGISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/R600GenDAGISel.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,dag-isel)
endif

ifneq ($(filter %R600GenInstrInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/R600GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/R600GenInstrInfo.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,instr-info)
endif

ifneq ($(filter %R600GenMCCodeEmitter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/R600GenMCCodeEmitter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/R600GenMCCodeEmitter.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,emitter)
endif

ifneq ($(filter %R600GenRegisterInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/R600GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/R600GenRegisterInfo.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,register-info)
endif

ifneq ($(filter %R600GenSubtargetInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/R600GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/R600GenSubtargetInfo.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,subtarget)
endif

ifneq ($(filter %R600GenDFAPacketizer.inc,$(tblgen_gen_tables)),)
$(generated_sources)/R600GenDFAPacketizer.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/R600GenDFAPacketizer.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,dfa-packetizer)
endif

else
# normal rules
ifneq ($(filter %GenRegisterInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenRegisterInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterInfo.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,register-info)
endif

ifneq ($(filter %GenInstrInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenInstrInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenInstrInfo.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                    $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,instr-info)
endif

ifneq ($(filter %GenAsmWriter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmWriter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmWriter.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                    $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,asm-writer)
endif

ifneq ($(filter %GenAsmWriter1.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmWriter1.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmWriter1.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                     $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,asm-writer -asmwriternum=1)
endif

ifneq ($(filter %GenAsmMatcher.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenAsmMatcher.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenAsmMatcher.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                     $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,asm-matcher)
endif

# TODO(srhines): Is this needed
ifneq ($(filter %GenCodeEmitter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenCodeEmitter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenCodeEmitter.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                      $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,emitter)
endif

ifneq ($(filter %GenMCCodeEmitter.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenMCCodeEmitter.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenMCCodeEmitter.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,emitter)
endif

ifneq ($(filter %GenMCPseudoLowering.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenMCPseudoLowering.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenMCPseudoLowering.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                           $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,pseudo-lowering)
endif

ifneq ($(filter %GenDAGISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenDAGISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenDAGISel.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                  $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,dag-isel)
endif

ifneq ($(filter %GenDisassemblerTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenDisassemblerTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenDisassemblerTables.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                             $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,disassembler)
endif

ifneq ($(filter %GenEDInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenEDInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenEDInfo.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                 $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,enhanced-disassembly-info)
endif

ifneq ($(filter %GenFastISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenFastISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenFastISel.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                   $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,fast-isel)
endif

ifneq ($(filter %GenSubtargetInfo.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSubtargetInfo.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSubtargetInfo.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,subtarget)
endif

ifneq ($(filter %GenCallingConv.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenCallingConv.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenCallingConv.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                      $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,callingconv)
endif

ifneq ($(filter %GenTgtIntrinsicEnums.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenTgtIntrinsicEnums.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenTgtIntrinsicEnums.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                     $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,intrinsic-enums)
endif

ifneq ($(filter %GenTgtIntrinsicImpl.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenTgtIntrinsicImpl.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenTgtIntrinsicImpl.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                     $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,intrinsic-impl)
endif

ifneq ($(findstring ARMGenDecoderTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/ARMGenDecoderTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/ARMGenDecoderTables.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                          $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,arm-decoder)
endif

ifneq ($(filter %GenGlobalISel.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenGlobalISel.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenGlobalISel.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,global-isel)
endif

ifneq ($(filter %GenExegesis.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenExegesis.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenExegesis.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,global-isel)
endif

ifneq ($(filter %GenRegisterBank.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenRegisterBank.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenRegisterBank.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,register-bank)
endif

ifneq ($(filter %GenSystemRegister.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSystemRegister.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSystemRegister.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,searchable-tables)
endif

ifneq ($(filter %GenSystemOperands.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSystemOperands.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSystemOperands.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,searchable-tables)
endif

ifneq ($(filter %GenEVEX2VEXTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenEVEX2VEXTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenEVEX2VEXTables.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,x86-EVEX2VEX-tables)
endif

ifneq ($(filter %GenIntrinsicEnums.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenIntrinsicEnums.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenIntrinsicEnums.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,intrinsic-enums)
endif

ifneq ($(filter %GenIntrinsicImpl.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenIntrinsicImpl.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenIntrinsicImpl.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,intrinsic-impl)
endif

ifneq ($(filter %GenSearchableTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%GenSearchableTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%GenSearchableTables.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,searchable-tables)
endif

ifneq ($(filter %AttributesCompatFunc.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%AttributesCompatFunc.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%AttributesCompatFunc.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,attrs)
endif

ifneq ($(filter %InstCombineTables.inc,$(tblgen_gen_tables)),)
$(warning "z_test InstCombineTables.inc")
$(generated_sources)/%InstCombineTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%InstCombineTables.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,searchable-tables)
endif

ifneq ($(filter %Options.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%Options.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%Options.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,opt-parser-defs)
endif

ifneq ($(filter %AArch64GenPreLegalizeGICombiner.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%AArch64GenPreLegalizeGICombiner.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%AArch64GenPreLegalizeGICombiner.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AArch64PreLegalizerCombinerHelper")
endif

ifneq ($(filter %AArch64GenPostLegalizeGICombiner.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%AArch64GenPostLegalizeGICombiner.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%AArch64GenPostLegalizeGICombiner.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AArch64PostLegalizerCombinerHelper")
endif

ifneq ($(filter %AArch64GenPostLegalizeGILowering.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%AArch64GenPostLegalizeGILowering.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%AArch64GenPostLegalizeGILowering.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AArch64PostLegalizerLoweringHelper")
endif

ifneq ($(filter %AMDGPUGenPreLegalizeGICombiner.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%AMDGPUGenPreLegalizeGICombiner.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%AMDGPUGenPreLegalizeGICombiner.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AMDGPUPreLegalizerCombinerHelper")
endif

ifneq ($(filter %AMDGPUGenPostLegalizeGICombiner.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%AMDGPUGenPostLegalizeGICombiner.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%AMDGPUGenPostLegalizeGICombiner.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AMDGPUPostLegalizerCombinerHelper")
endif

ifneq ($(filter %AMDGPUGenRegBankGICombiner.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%AMDGPUGenRegBankGICombiner.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%AMDGPUGenRegBankGICombiner.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AMDGPURegBankCombinerHelper")
endif

ifneq ($(filter %OMP.h.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%OMP.h.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%OMP.h.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,directive-decl)
endif

ifneq ($(filter %OMP.cpp.inc,$(tblgen_gen_tables)),)
$(generated_sources)/%OMP.cpp.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%OMP.cpp.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,directive-gen)
endif

ifneq ($(filter %OMP.cpp,$(tblgen_gen_tables)),)
$(generated_sources)/%OMP.cpp: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/%OMP.cpp: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,directive-impl)
endif

# endif normal
endif

# Reset local variables
tblgen_td_deps :=

endif
