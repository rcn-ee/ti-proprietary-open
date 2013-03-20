# Copyright (C) 2013 The Android Open Source Project
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

ifeq ($(strip $(NFC_TI_DEVICE)),true)

TI_WILINK_NFC_FW_PATH := $(TARGET_OUT_ETC)/firmware

WPAN_NFC_FW_BINS := \
	TIInit_11.7.27.bts \
	TINfcInit_12.8.32.72.bts \
	TINfcInit_12.8.32.80.bts

# path to NFC fws (related to top dir)
FW_NFC_PATH := $(TARGET_EXTRACTED_FW)/nfc

# path related to current location
FW_NFC_FULL_PATH := ../../../../../../$(FW_NFC_PATH)

include $(CLEAR_VARS)
LOCAL_MODULE := TIInit_11.7.27.bts
LOCAL_SRC_FILES := $(FW_NFC_FULL_PATH)/TIInit_11.7.27.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_NFC_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TINfcInit_12.8.32.72.bts
LOCAL_SRC_FILES := $(FW_NFC_FULL_PATH)/TINfcInit_12.8.32.72.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_NFC_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TINfcInit_12.8.32.80.bts
LOCAL_SRC_FILES := $(FW_NFC_FULL_PATH)/TINfcInit_12.8.32.80.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_NFC_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

WPAN_NFC_FW_FILES := $(addprefix $(LOCAL_PATH)/$(FW_NFC_FULL_PATH)/, $(WPAN_NFC_FW_BINS))
.PHONY: $(WPAN_NFC_FW_FILES)
$(WPAN_NFC_FW_FILES): $(FW_NFC_FULL_PATH)
	$(hide) tar -C $(FW_NFC_PATH) --strip-components=2 \
		-f $(WPAN_TGZ) -xzp wpan/nfc/$(notdir $@)

$(FW_NFC_FULL_PATH):
	$(hide) mkdir -p $(FW_NFC_PATH)

endif

