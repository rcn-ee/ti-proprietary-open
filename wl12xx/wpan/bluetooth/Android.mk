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

ifeq ($(strip $(BOARD_HAVE_BLUETOOTH_TI)),true)

TI_WILINK_BT_FW_PATH := $(TARGET_OUT_ETC)/firmware

WPAN_BT_FW_BINS := \
	TIInit_7.2.31.bts \
	TIInit_7.6.15.bts \
	TIInit_10.6.15.bts \
	TIInit_11.8.32.bts \
	TIInit_12.7.27.bts \
	TIInit_12.8.32.bts \
	TIInit_12.10.28.bts

# path to BT fws (related to top dir)
FW_BT_PATH := $(TARGET_EXTRACTED_FW)/bt

# path related to current location
FW_BT_FULL_PATH := ../../../../../../$(FW_BT_PATH)

include $(CLEAR_VARS)
LOCAL_MODULE := TIInit_7.2.31.bts
LOCAL_SRC_FILES := $(FW_BT_FULL_PATH)/TIInit_7.2.31.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_BT_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)
include $(CLEAR_VARS)
LOCAL_MODULE := TIInit_7.6.15.bts
LOCAL_SRC_FILES := $(FW_BT_FULL_PATH)/TIInit_7.6.15.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_BT_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TIInit_10.6.15.bts
LOCAL_SRC_FILES := $(FW_BT_FULL_PATH)/TIInit_10.6.15.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_BT_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TIInit_11.8.32.bts
LOCAL_SRC_FILES := $(FW_BT_FULL_PATH)/TIInit_11.8.32.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_BT_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TIInit_12.7.27.bts
LOCAL_SRC_FILES := $(FW_BT_FULL_PATH)/TIInit_12.7.27.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_BT_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TIInit_12.8.32.bts
LOCAL_SRC_FILES := $(FW_BT_FULL_PATH)/TIInit_12.8.32.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_BT_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TIInit_12.10.28.bts
LOCAL_SRC_FILES := $(FW_BT_FULL_PATH)/TIInit_12.10.28.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_BT_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

WPAN_BT_FW_FILES := $(addprefix $(LOCAL_PATH)/$(FW_BT_FULL_PATH)/, $(WPAN_BT_FW_BINS))
.PHONY: $(WPAN_BT_FW_FILES)
$(WPAN_BT_FW_FILES): $(FW_BT_FULL_PATH)
	$(hide) tar -C $(FW_BT_PATH) --strip-components=2 \
		-f $(WPAN_TGZ) -xzp wpan/bluetooth/$(notdir $@)

$(FW_BT_FULL_PATH):
	$(hide) mkdir -p $(FW_BT_PATH)

endif
