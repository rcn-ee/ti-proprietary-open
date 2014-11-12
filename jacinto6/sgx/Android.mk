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

define _add-sgx-vendor-lib
include $$(CLEAR_VARS)
$(if $(word 2,$1),$(error Invalid SGX module name $1))
LOCAL_MODULE := $(basename $(notdir $1))
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(suffix $1)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $$(TARGET_OUT_VENDOR)/$(dir $1)
LOCAL_STRIP_MODULE := false
OVERRIDE_BUILT_MODULE_PATH := $$(TARGET_OUT_INTERMEDIATE_LIBRARIES)
LOCAL_PATH := $$(img-sgx.untarred_bin)
include $$(BUILD_SYSTEM)/base_rules.mk
$$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $$(img-sgx.untarred_bin)/$1
$$(LOCAL_BUILT_MODULE) : $$(img-sgx.untarred_timestamp) | $$(ACP)
	@echo "Copy $$@ <- $$(PRIVATE_SRC)"
	@mkdir -p $(dir $$@)
	$$(hide) $$(ACP) -fp $$(PRIVATE_SRC) $$@
endef

define _add-sgx-vendor-bin
include $$(CLEAR_VARS)
$(if $(word 2,$1),$(error Invalid SGX module name $1))
LOCAL_MODULE := $(basename $(notdir $1))
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(suffix $1)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $$(TARGET_OUT_VENDOR)/$(dir $1)
LOCAL_STRIP_MODULE := false
OVERRIDE_BUILT_MODULE_PATH := $$(TARGET_OUT_INTERMEDIATE_EXECUTABLES)
LOCAL_PATH := $$(img-sgx.untarred_bin)
include $$(BUILD_SYSTEM)/base_rules.mk
$$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $$(img-sgx.untarred_bin)/$1
$$(LOCAL_BUILT_MODULE) : $$(img-sgx.untarred_timestamp) | $$(ACP)
	@echo "Copy $$@ <- $$(PRIVATE_SRC)"
	@mkdir -p $$(dir $$@)
	$$(hide) $$(ACP) -fp $$(PRIVATE_SRC) $$@
endef

define _add-sgx-vendor-etc
include $$(CLEAR_VARS)
$(if $(word 2,$1),$(error Invalid SGX module name $1))
LOCAL_MODULE := $(basename $(notdir $1))
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(suffix $1)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $$(TARGET_OUT)/$(dir $1)
LOCAL_STRIP_MODULE := false
OVERRIDE_BUILT_MODULE_PATH := $$(TARGET_OUT_INTERMEDIATE_ETC)
LOCAL_PATH := $$(img-sgx.untarred_bin)
include $$(BUILD_SYSTEM)/base_rules.mk
$$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $$(img-sgx.untarred_bin)/$1
$$(LOCAL_BUILT_MODULE) : $$(img-sgx.untarred_timestamp) | $$(ACP)
	@echo "Copy $$@ <- $$(PRIVATE_SRC)"
	@mkdir -p $$(dir $$@)
	$$(hide) $$(ACP) -fp $$(PRIVATE_SRC) $$@
endef

define _add-sgx-vendor-km
include $$(CLEAR_VARS)
$(if $(word 2,$1),$(error Invalid SGX module name $1))
LOCAL_MODULE := $(basename $(notdir $1))
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(suffix $1)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $$(TARGET_OUT)/lib/$(dir $1)
LOCAL_STRIP_MODULE := false
OVERRIDE_BUILT_MODULE_PATH := $$(TARGET_OUT_INTERMEDIATE_ETC)
LOCAL_PATH := $$(img-sgx.untarred_bin)
include $$(BUILD_SYSTEM)/base_rules.mk
$$(LOCAL_BUILT_MODULE) : PRIVATE_SRC := $$(img-sgx.untarred_bin)/$1
$$(LOCAL_BUILT_MODULE) : $$(img-sgx.untarred_timestamp) | $$(ACP)
	@echo "Copy $$@ <- $$(PRIVATE_SRC)"
	@mkdir -p $$(dir $$@)
	$$(hide) $$(ACP) -fp $$(PRIVATE_SRC) $$@
endef

prebuilt_sgx_vendor_libs := \
	lib/libIMGegl.so \
	lib/libglslcompiler.so \
	lib/libusc.so \
	lib/libPVRScopeServices.so \
	lib/libsrv_um.so \
	lib/hw/gralloc.jacinto6.so \
	lib/hw/memtrack.jacinto6.so \
	lib/libpvrANDROID_WSEGL.so \
	lib/libpvr2d.so \
	lib/libsrv_init.so \
	lib/egl/libGLESv1_CM_POWERVR_SGX544_116.so \
	lib/egl/libGLESv2_POWERVR_SGX544_116.so \
	lib/egl/libEGL_POWERVR_SGX544_116.so

prebuilt_sgx_vendor_bins := \
	bin/pvrsrvinit \
	bin/pvrsrvctl

#prebuilt_sgx_vendor_etc := \
#	etc/powervr.ini

prebuilt_sgx_vendor_km := \
	modules/pvrsrvkm.ko

prebuilt_sgx_modules := \
  $(foreach _file,$(prebuilt_sgx_vendor_libs) $(prebuilt_sgx_vendor_bins) $(prebuilt_sgx_vendor_etc) $(prebuilt_sgx_vendor_km),\
    $(notdir $(basename $(_file))))

include $(CLEAR_VARS)
LOCAL_MODULE := ti_jacinto6_sgx_libs
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(prebuilt_sgx_modules)
include $(BUILD_PHONY_PACKAGE)

$(foreach _file,$(prebuilt_sgx_vendor_libs),\
  $(eval $(call _add-sgx-vendor-lib,$(_file))))

$(foreach _file,$(prebuilt_sgx_vendor_bins),\
  $(eval $(call _add-sgx-vendor-bin,$(_file))))

$(foreach _file,$(prebuilt_sgx_vendor_etc),\
  $(eval $(call _add-sgx-vendor-etc,$(_file))))

$(foreach _file,$(prebuilt_sgx_vendor_km),\
  $(eval $(call _add-sgx-vendor-km,$(_file))))

prebuilt_sgx_modules :=
prebuilt_sgx_vendor_libs :=
prebuilt_sgx_vendor_bins :=
prebuilt_sgx_vendor_etc :=
prebuilt_sgx_vendor_km :=
_add-sgx-vendor-lib :=
_add-sgx-vendor-bin :=
_add-sgx-vendor-etc :=
_add-sgx-vendor-km :=
