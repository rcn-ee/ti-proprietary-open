LOCAL_PATH := $(my-dir)
$(hide $(shell $(LOCAL_PATH)/untar.sh $(LOCAL_PATH)/omap4 sgx $(LOCAL_PATH)/omap4/sgx.tgz))
$(hide $(shell $(LOCAL_PATH)/untar.sh $(LOCAL_PATH)/wl12xx wpan $(LOCAL_PATH)/wl12xx/wpan.tgz))

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
LOCAL_MODULE := ducati-m3.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(ti-ducati.untarred_intermediates)/ducati-m3.bin
$(LOCAL_BUILT_MODULE) : $(ti-ducati.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@
endif
#############################################

include $(call all-subdir-makefiles)
