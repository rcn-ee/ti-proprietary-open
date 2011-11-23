LOCAL_PATH := $(call my-dir)

define _add-sgx-vendor-lib
include $$(CLEAR_VARS)
$(if $(word 2,$1),$(error Invalid SGX module name $1))
LOCAL_MODULE := $(basename $(notdir $1))
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(suffix $1)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $$(TARGET_OUT)$(abspath /vendor/$(dir $1))
LOCAL_STRIP_MODULE := false 
OVERRIDE_BUILT_MODULE_PATH := $$(TARGET_OUT_INTERMEDIATE_LIBRARIES)
include $$(BUILD_PREBUILT)
endef

define _add-sgx-vendor-bin
include $$(CLEAR_VARS)
$(if $(word 2,$1),$(error Invalid SGX module name $1))
LOCAL_MODULE := $(basename $(notdir $1))
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(suffix $1)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $$(TARGET_OUT)$(abspath /vendor/$(dir $1))
LOCAL_STRIP_MODULE := false
OVERRIDE_BUILT_MODULE_PATH := $$(TARGET_OUT_INTERMEDIATE_EXECUTABLES)
include $$(BUILD_PREBUILT)
endef


prebuilt_sgx_vendor_libs := \
	lib/libIMGegl.so \
	lib/libglslcompiler.so \
	lib/libusc.so \
	lib/libPVRScopeServices.so \
	lib/libsrv_um.so \
	lib/hw/gralloc.omap4.so \
	lib/libpvrANDROID_WSEGL.so \
	lib/libpvr2d.so \
	lib/libsrv_init.so \
	lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
	lib/egl/libGLESv2_POWERVR_SGX540_120.so \
	lib/egl/libEGL_POWERVR_SGX540_120.so

prebuilt_sgx_vendor_bins := \
	bin/pvrsrvinit

prebuilt_sgx_modules := \
  $(foreach _file,$(prebuilt_sgx_vendor_libs) $(prebuilt_sgx_vendor_bins),\
    $(notdir $(basename $(_file))))

include $(CLEAR_VARS)
LOCAL_MODULE := ti_omap4_sgx_libs
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(prebuilt_sgx_modules)
include $(BUILD_PHONY_PACKAGE)

$(foreach _file,$(prebuilt_sgx_vendor_libs),\
  $(eval $(call _add-sgx-vendor-lib,$(_file))))

$(foreach _file,$(prebuilt_sgx_vendor_bins),\
  $(eval $(call _add-sgx-vendor-bin,$(_file))))

prebuilt_sgx_modules :=
prebuilt_sgx_vendor_libs :=
prebuilt_sgx_vendor_bins :=
_add-sgx-vendor-lib :=
_add-sgx-vendor-bin :=
