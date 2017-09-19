# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

ifeq ($(strip $(BOARD_WLAN_DEVICE)),wl12xx_mac80211)

TI_WILINK_FW_PATH := $(TARGET_OUT_VENDOR)/firmware/ti-connectivity

ti-wl12xx-wlan.untarred_intermediates := $(call intermediates-dir-for, FAKE, ti-wl12xx-wlan.untarred)
ti-wl12xx-wlan.untarred_timestamp := $(ti-wl12xx-wlan.untarred_intermediates)/stamp

$(ti-wl12xx-wlan.untarred_timestamp) : $(WLAN_TGZ)
	@echo "Unzip $(dir $@) <- $<)"
	$(hide) rm -rf $(dir $@) && mkdir -p $(dir $@)
	$(hide) tar -C $(dir $@) -zxf $<
	$(hide) touch $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl18xx-fw-4.bin
LOCAL_SRC_FILES := wl18xx-fw-4.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_PATH := $(TI_WILINK_FW_PATH)
LOCAL_MODULE_TAGS := optional

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(ti-wl12xx-wlan.untarred_intermediates)/wlan/wl18xx-fw-4.bin
$(LOCAL_BUILT_MODULE) : $(ti-wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

include $(CLEAR_VARS)
LOCAL_MODULE := wl18xx-conf.bin
LOCAL_SRC_FILES := wl18xx-conf.bin
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_PATH := $(TI_WILINK_FW_PATH)
LOCAL_MODULE_TAGS := optional

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $(ti-wl12xx-wlan.untarred_intermediates)/wlan/wl18xx-conf.bin
$(LOCAL_BUILT_MODULE) : $(ti-wl12xx-wlan.untarred_timestamp) | $(ACP)
	@echo "Copy $@ <- $(PRIVATE_SRC)"
	@mkdir -p $(dir $@)
	$(hide) $(ACP) -fp $(PRIVATE_SRC) $@

endif
