LOCAL_PATH := $(my-dir)
img-sgx.untarred_intermediates := $(call intermediates-dir-for, FAKE, img-sgx.untarred)
img-sgx.untarred_timestamp := $(img-sgx.untarred_intermediates)/stamp
img-sgx.untarred_bin := $(img-sgx.untarred_intermediates)/sgx
img-sgx.tar := $(LOCAL_PATH)/$(TARGET_BOARD_PLATFORM)/sgx.tgz

include $(call all-subdir-makefiles)

$(img-sgx.untarred_timestamp) : $(img-sgx.tar)
	@echo "Unzip $(dir $@) <- $<"
	$(hide) rm -rf $(dir $@) && mkdir -p $(dir $@)
	$(hide) tar -C $(dir $@) -xzf $<
	$(hide) touch $@


# Install Ducati from the TGZ defined in the device-inherited mk file
#############################################
ifneq ($(DUCATI_TGZ),)
ti-ducati.untarred_intermediates := $(call intermediates-dir-for, FAKE, ti-ducati.untarred)
ti-ducati.untarred_timestamp := $(ti-ducati.untarred_intermediates)/stamp

$(ti-ducati.untarred_timestamp) : $(DUCATI_TGZ)
	@echo "Unzip $(dir $@) <- $<)"
	$(hide) rm -rf $(dir $@) && mkdir -p $(dir $@)
	$(hide) tar -C $(dir $@) -zxf $<
	$(hide) touch $@

include $(CLEAR_VARS)
LOCAL_MODULE := $(DUCATI_BINARY)
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(ti-ducati.untarred_intermediates)/$(DUCATI_BINARY)
$(LOCAL_BUILT_MODULE) : $(ti-ducati.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@
endif
#############################################

#############################################
# Install Tesla-binary FW
#############################################

ifneq ($(TESLA_TGZ),)
ti-tesla.untarred_intermediates := $(call intermediates-dir-for, FAKE, ti-tesla.untarred)
ti-tesla.untarred_timestamp := $(ti-tesla.untarred_intermediates)/stamp

$(ti-tesla.untarred_timestamp) : $(TESLA_TGZ)
	@echo "Unzip $(dir $@) <- $<)"
	$(hide) rm -rf $(dir $@) && mkdir -p $(dir $@)
	$(hide) tar -C $(dir $@) -zxf $<
	$(hide) touch $@

include $(CLEAR_VARS)
LOCAL_MODULE := tesla-dsp.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(ti-tesla.untarred_intermediates)/tesla-dsp.bin
$(LOCAL_BUILT_MODULE) : $(ti-tesla.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@
endif

#############################################
