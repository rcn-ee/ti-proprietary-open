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

TI_WILINK_FM_FW_PATH := $(TARGET_OUT_ETC)/firmware

WPAN_FM_FW_BINS := \
	fmc_ch8_1283.2.bts \
	fmc_ch8_1853.3.bts \
	fmc_ch8_1893.2.bts \
	fmc_ch8_1893.3.bts \
	fmc_init_1273.2.bts \
	fm_rx_ch8_1283.2.bts \
	fm_rx_ch8_1853.3.bts \
	fm_rx_ch8_1893.2.bts \
	fm_rx_ch8_1893.3.bts \
	fm_rx_init_1273.2.bts \
	fm_tx_ch8_1273.1.bts \
	fm_tx_ch8_1273.2.bts \
	fm_tx_ch8_1283.2.bts \
	fm_tx_ch8_1853.3.bts \
	fm_tx_ch8_1893.2.bts \
	fm_tx_ch8_1893.3.bts \
	fm_tx_init_1273.2.bts

# path to NFC fws (related to top dir)
FW_FM_PATH := $(TARGET_EXTRACTED_FW)/fm

# path related to current location
FW_FM_FULL_PATH := ../../../../../../$(FW_FM_PATH)

include $(CLEAR_VARS)
LOCAL_MODULE := fmc_ch8_1283.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fmc_ch8_1283.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fmc_ch8_1853.3.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fmc_ch8_1853.3.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fmc_ch8_1893.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fmc_ch8_1893.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fmc_ch8_1893.3.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fmc_ch8_1893.3.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fmc_init_1273.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fmc_init_1273.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_rx_ch8_1283.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_rx_ch8_1283.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_rx_ch8_1853.3.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_rx_ch8_1853.3.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_rx_ch8_1893.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_rx_ch8_1893.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_rx_ch8_1893.3.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_rx_ch8_1893.3.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_rx_init_1273.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_rx_init_1273.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_tx_ch8_1273.1.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_tx_ch8_1273.1.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_tx_ch8_1273.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_tx_ch8_1273.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_tx_ch8_1283.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_tx_ch8_1283.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_tx_ch8_1853.3.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_tx_ch8_1853.3.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_tx_ch8_1893.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_tx_ch8_1893.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_tx_ch8_1893.3.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_tx_ch8_1893.3.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fm_tx_init_1273.2.bts
LOCAL_SRC_FILES := $(FW_FM_FULL_PATH)/fm_tx_init_1273.2.bts
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $(TI_WILINK_FM_FW_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := ti
include $(BUILD_PREBUILT)

WPAN_FM_FW_FILES := $(addprefix $(LOCAL_PATH)/$(FW_FM_FULL_PATH)/, $(WPAN_FM_FW_BINS))
.PHONY: $(WPAN_FM_FW_FILES)
$(WPAN_FM_FW_FILES): $(FW_FM_FULL_PATH)
	$(hide) tar -C $(FW_FM_PATH) --strip-components=2 \
		-f $(WPAN_TGZ) -xzp wpan/fmradio/$(notdir $@)

$(FW_FM_FULL_PATH):
	$(hide) mkdir -p $(FW_FM_PATH)
