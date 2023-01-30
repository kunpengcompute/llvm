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


ifeq (R600.td,$(TBLGEN_IN_TD))


# rules for R600.td
ifneq ($(filter %R600GenAsmWriter.inc,$(tblgen_gen_tables)),)

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
GenRegisterInfo_inc := $(filter %GenRegisterInfo.inc, $(tblgen_gen_tables))
ifneq ($(GenRegisterInfo_inc),)
$(GenRegisterInfo_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenRegisterInfo_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,register-info)
endif

GenInstrInfo_inc := $(filter %GenInstrInfo.inc, $(tblgen_gen_tables))
ifneq ($(GenInstrInfo_inc),)
$(GenInstrInfo_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenInstrInfo_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                     $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,instr-info)
endif

GenAsmWriter_inc := $(filter %GenAsmWriter.inc, $(tblgen_gen_tables))
ifneq ($(GenAsmWriter_inc),)
$(GenAsmWriter_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenAsmWriter_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                     $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,asm-writer)
endif

GenAsmWriter1_inc := $(filter %GenAsmWriter1.inc, $(tblgen_gen_tables))
ifneq ($(GenAsmWriter1_inc),)
$(GenAsmWriter1_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenAsmWriter1_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                      $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,asm-writer -asmwriternum=1)
endif

GenAsmMatcher_inc := $(filter %GenAsmMatcher.inc, $(tblgen_gen_tables))
ifneq ($(GenAsmMatcher_inc),)
$(GenAsmMatcher_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenAsmMatcher_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                      $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,asm-matcher)
endif

# TODO(srhines): Is this needed
GenCodeEmitter_inc := $(filter %GenCodeEmitter.inc, $(tblgen_gen_tables))
ifneq ($(GenCodeEmitter_inc),)
$(GenCodeEmitter_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenCodeEmitter_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,emitter)
endif

GenMCCodeEmitter_inc := $(filter %GenMCCodeEmitter.inc, $(tblgen_gen_tables))
ifneq ($(GenMCCodeEmitter_inc),)
$(GenMCCodeEmitter_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenMCCodeEmitter_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                         $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,emitter)
endif

GenMCPseudoLowering_inc := $(filter %GenMCPseudoLowering.inc, $(tblgen_gen_tables))
ifneq ($(GenMCPseudoLowering_inc),)
$(GenMCPseudoLowering_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenMCPseudoLowering_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                            $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,pseudo-lowering)
endif

GenDAGISel_inc := $(filter %GenDAGISel.inc, $(tblgen_gen_tables))
ifneq ($(GenDAGISel_inc),)
$(GenDAGISel_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenDAGISel_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                   $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,dag-isel)
endif

GenDisassemblerTables_inc := $(filter %GenDisassemblerTables.inc, $(tblgen_gen_tables))
ifneq ($(GenDisassemblerTables_inc),)
$(GenDisassemblerTables_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenDisassemblerTables_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                              $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,disassembler)
endif

GenEDInfo_inc := $(filter %GenEDInfo.inc, $(tblgen_gen_tables))
ifneq ($(GenEDInfo_inc),)
$(GenEDInfo_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenEDInfo_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                  $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,enhanced-disassembly-info)
endif

GenFastISel_inc := $(filter %GenFastISel.inc, $(tblgen_gen_tables))
ifneq ($(GenFastISel_inc),)
$(GenFastISel_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenFastISel_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                    $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,fast-isel)
endif

GenSubtargetInfo_inc := $(filter %GenSubtargetInfo.inc, $(tblgen_gen_tables))
ifneq ($(GenSubtargetInfo_inc),)
$(GenSubtargetInfo_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenSubtargetInfo_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                      $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,subtarget)
endif

GenCallingConv_inc := $(filter %GenCallingConv.inc, $(tblgen_gen_tables))
ifneq ($(GenCallingConv_inc),)
$(GenCallingConv_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenCallingConv_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,callingconv)
endif

GenTgtIntrinsicEnums_inc := $(filter %GenTgtIntrinsicEnums.inc, $(tblgen_gen_tables))
ifneq ($(GenTgtIntrinsicEnums_inc),)
$(GenTgtIntrinsicEnums_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenTgtIntrinsicEnums_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                             $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,intrinsic-enums)
endif

GenTgtIntrinsicImpl_inc := $(filter %GenTgtIntrinsicImpl.inc, $(tblgen_gen_tables))
ifneq ($(GenTgtIntrinsicImpl_inc),)
$(GenTgtIntrinsicImpl_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenTgtIntrinsicImpl_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                            $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,intrinsic-impl)
endif

ifneq ($(findstring ARMGenDecoderTables.inc,$(tblgen_gen_tables)),)
$(generated_sources)/ARMGenDecoderTables.inc: TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(generated_sources)/ARMGenDecoderTables.inc: $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                          $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,arm-decoder)
endif

GenGlobalISel_inc := $(filter %GenGlobalISel.inc, $(tblgen_gen_tables))
ifneq ($(GenGlobalISel_inc),)
$(GenGlobalISel_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenGlobalISel_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                         $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,global-isel)
endif

GenExegesis_inc := $(filter %GenExegesis.inc, $(tblgen_gen_tables))
ifneq ($(GenExegesis_inc),)
$(GenExegesis_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenExegesis_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                     $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,global-isel)
endif

GenRegisterBank_inc := $(filter %GenRegisterBank.inc, $(tblgen_gen_tables))
ifneq ($(GenRegisterBank_inc),)
$(GenRegisterBank_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenRegisterBank_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,register-bank)
endif

GenSystemRegister_inc := $(filter %GenSystemRegister.inc, $(tblgen_gen_tables))
ifneq ($(GenSystemRegister_inc),)
$(GenSystemRegister_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenSystemRegister_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                          $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,searchable-tables)
endif

GenSystemOperands_inc := $(filter %GenSystemOperands.inc, $(tblgen_gen_tables))
ifneq ($(GenSystemOperands_inc),)
$(GenSystemOperands_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenSystemOperands_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                          $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,searchable-tables)
endif

GenEVEX2VEXTables_inc := $(filter %GenEVEX2VEXTables.inc, $(tblgen_gen_tables))
ifneq ($(GenEVEX2VEXTables_inc),)
$(GenEVEX2VEXTables_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenEVEX2VEXTables_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,x86-EVEX2VEX-tables)
endif

GenIntrinsicEnums_inc := $(filter %GenIntrinsicEnums.inc, $(tblgen_gen_tables))
ifneq ($(filter %GenIntrinsicEnums.inc,$(tblgen_gen_tables)),)
$(GenIntrinsicEnums_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenIntrinsicEnums_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                          $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,intrinsic-enums)
endif

GenIntrinsicImpl_inc := $(filter %GenIntrinsicImpl.inc, $(tblgen_gen_tables))
ifneq ($(GenIntrinsicImpl_inc),)
$(GenIntrinsicImpl_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenIntrinsicImpl_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                         $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,intrinsic-impl)
endif

GenSearchableTables_inc := $(filter %GenSearchableTables.inc, $(tblgen_gen_tables))
ifneq ($(GenSearchableTables_inc),)
$(GenSearchableTables_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GenSearchableTables_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                            $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,searchable-tables)
endif

AttributesCompatFunc_inc := $(filter %AttributesCompatFunc.inc, $(tblgen_gen_tables))
ifneq ($(AttributesCompatFunc_inc),)
$(AttributesCompatFunc_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(AttributesCompatFunc_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,attrs)
endif

InstCombineTables_inc := $(filter %InstCombineTables.inc, $(tblgen_gen_tables))
ifneq ($(InstCombineTables_inc),)
$(InstCombineTables_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(InstCombineTables_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                          $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,searchable-tables)
endif

options_inc := $(filter %Options.inc, $(tblgen_gen_tables))
ifneq ($(options_inc),)
$(options_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(options_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,opt-parser-defs)
endif

AArch64GenPreLegalizeGICombiner_inc := $(filter %AArch64GenPreLegalizeGICombiner.inc, $(tblgen_gen_tables))
ifneq ($(AArch64GenPreLegalizeGICombiner_inc),)
$(AArch64GenPreLegalizeGICombiner_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(AArch64GenPreLegalizeGICombiner_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                        $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AArch64PreLegalizerCombinerHelper")
endif

AArch64GenPostLegalizeGICombiner_inc := $(filter %AArch64GenPostLegalizeGICombiner.inc, $(tblgen_gen_tables))
ifneq ($(AArch64GenPostLegalizeGICombiner_inc),)
$(AArch64GenPostLegalizeGICombiner_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(AArch64GenPostLegalizeGICombiner_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                         $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AArch64PostLegalizerCombinerHelper")
endif

AArch64GenPostLegalizeGILowering_inc := $(filter %AArch64GenPostLegalizeGILowering.inc, $(tblgen_gen_tables))
ifneq ($(AArch64GenPostLegalizeGILowering_inc),)
$(AArch64GenPostLegalizeGILowering_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(AArch64GenPostLegalizeGILowering_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                         $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AArch64PostLegalizerLoweringHelper")
endif

AMDGPUGenPreLegalizeGICombiner_inc := $(filter %AMDGPUGenPreLegalizeGICombiner.inc, $(tblgen_gen_tables))
ifneq ($(AMDGPUGenPreLegalizeGICombiner_inc),)
$(AMDGPUGenPreLegalizeGICombiner_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(AMDGPUGenPreLegalizeGICombiner_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                       $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AMDGPUPreLegalizerCombinerHelper")
endif

AMDGPUGenPostLegalizeGICombiner_inc := $(filter %AMDGPUGenPostLegalizeGICombiner.inc, $(tblgen_gen_tables))
ifneq ($(AMDGPUGenPostLegalizeGICombiner_inc),)
$(AMDGPUGenPostLegalizeGICombiner_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(AMDGPUGenPostLegalizeGICombiner_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                    $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AMDGPUPostLegalizerCombinerHelper")
endif

AMDGPUGenRegBankGICombiner_inc := $(filter %AMDGPUGenRegBankGICombiner.inc, $(tblgen_gen_tables))
ifneq ($(AMDGPUGenRegBankGICombiner_inc),)
$(AMDGPUGenRegBankGICombiner_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(AMDGPUGenRegBankGICombiner_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                                    $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out2,global-isel-combiner,-combiners="AMDGPURegBankCombinerHelper")
endif

omp_h_inc := $(filter %OMP.h.inc, $(tblgen_gen_tables))
ifneq ($(omp_h_inc),)
$(omp_h_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(omp_h_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
              $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,directive-decl)
endif

omp_cpp_inc := $(filter %OMP.cpp.inc, $(tblgen_gen_tables))
ifneq ($(omp_cpp_inc),)
$(omp_cpp_inc): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(omp_cpp_inc): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
                $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,directive-gen)
endif

omp_cpp := $(filter %OMP.cpp, $(tblgen_gen_tables))
ifneq ($(omp_cpp),)
$(omp_cpp): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(omp_cpp): $(tblgen_source_dir)/$(TBLGEN_IN_TD) \
            $(tblgen_td_deps) $(LLVM70_TBLGEN)
	$(call transform70-td-to-out,directive-impl)
endif

# endif normal
endif

# Reset local variables
tblgen_td_deps :=

endif
