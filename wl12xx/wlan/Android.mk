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

TI_WILINK_FW_PATH := $(TARGET_OUT_ETC)/firmware/ti-connectivity

WLAN_FW_BINS := \
	wl18xx-fw-4.bin \
	wl18xx-conf.bin

# path to FM fws (related to top dir)
FW_WLAN_PATH := $(TARGET_EXTRACTED_FW)/wlan

# path related to current location
FW_WLAN_FULL_PATH := ../../../../../$(FW_WLAN_PATH)

include $(CLEAR_VARS)
LOCAL_MODULE := wl18xx-fw-4.bin
LOCAL_SRC_FILES := $(FW_WLAN_FULL_PATH)/wl18xx-fw-4.bin
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)
include $(CLEAR_VARS)
LOCAL_MODULE := wl18xx-conf.bin
LOCAL_SRC_FILES := $(FW_WLAN_FULL_PATH)/wl18xx-conf.bin
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

WLAN_FW_FILES := $(addprefix $(LOCAL_PATH)/$(FW_WLAN_FULL_PATH)/, $(WLAN_FW_BINS))
.PHONY: $(WLAN_FW_FILES)
$(WLAN_FW_FILES): $(FW_WLAN_FULL_PATH)
	$(hide) tar -C $(FW_WLAN_PATH) --strip-components=1 \
		-f $(WLAN_TGZ) -xzp wlan/$(notdir $@)

$(FW_WLAN_FULL_PATH):
	$(hide) mkdir -p $(FW_WLAN_PATH)

endif

