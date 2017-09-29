# Copyright (C) 2011 The Android Open Source Project
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
#

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

MODULE_TARGET := pvrsrvkm.ko
LOCAL_MODULE := $(basename $(MODULE_TARGET))
LOCAL_MODULE_SUFFIX := $(suffix $(MODULE_TARGET))
LOCAL_MODULE_CLASS := ETC

local-build := $(LOCAL_PATH)/eurasia_km/eurasiacon/build/linux2/omap_android
out-intermediates := $(call intermediates-dir-for, ETC, $(LOCAL_MODULE))

PVRSRVKM := $(LOCAL_PATH)/$(MODULE_TARGET)

$(PVRSRVKM): $(local-build)/Makefile $(KERNELDIR)/.version
	@echo "Building $@"
	@$(MAKE) -f Makefile -C $(local-build) \
		CROSS_COMPILE=arm-linux-androideabi- \
		KERNEL_CROSS_COMPILE=arm-linux-androideabi- \
		KERNELDIR=$(KERNELDIR) \
		ARCH=arm \
		ANDROID_ROOT=$(ANDROID_BUILD_TOP) \
		PLATFORM_RELEASE="8.0" \
		OUT=$(ANDROID_BUILD_TOP)/$(out-intermediates)
	@$(ACP) -fp $(ANDROID_BUILD_TOP)/$(out-intermediates)/target/$(MODULE_TARGET) $@
	@echo "Finished building $@"

GEN := $(out-intermediates)/$(MODULE_TARGET)
$(GEN): $(PVRSRVKM)
	@echo "Copying $@ <- $<"
	$(copy-file-to-target)

LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(MODULE_TARGET)
LOCAL_GENERATED_SOURCES += $(GEN)
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/modules
LOCAL_STRIP_MODULE := false
BOARD_VENDOR_KERNEL_MODULES += $(PVRSRVKM)
include $(BUILD_PREBUILT)
