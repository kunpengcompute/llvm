# ************************************************
# NEWER CLEAN STEPS MUST BE AT THE END OF THE LIST
# ************************************************
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/stingray/obj/STATIC_LIBRARIES/libLLVM70*)
$(call add-clean-step, rm -rf $(OUT_DIR)/target/product/stingray/obj/STATIC_LIBRARIES/libLLVM70ARMCodeGen_intermediates*)
$(call add-clean-step, rm -rf $(OUT_DIR)/host/$(HOST_PREBUILT_TAG)/obj/STATIC_LIBRARIES/libLLVM70ARM*)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/STATIC_LIBRARIES/libLLVM70ARM*)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/app_process__asan_intermediates*)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/STATIC_LIBRARIES/libLLVM70*)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/libLLVM70*)
$(call add-clean-step, rm -f external/llvm70/tools/llvm-config/BuildVariables.inc)
