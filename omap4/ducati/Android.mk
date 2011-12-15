LOCAL_PATH := $(call my-dir)

define _add-ducati-vendor-fw
include $$(CLEAR_VARS)
$(if $(word 2,$1),$(error Invalid Ducati module name $1))
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

define _add-ducati-dcc
include $$(CLEAR_VARS)
$(if $(word 2,$1),$(error Invalid SGX module name $1))
LOCAL_MODULE := $(basename $(notdir $1))
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(suffix $1)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $$(TARGET_OUT_DATA)$(abspath /misc/$(dir $1))
LOCAL_STRIP_MODULE := false
OVERRIDE_BUILT_MODULE_PATH := $$(TARGET_OUT_INTERMEDIATE_EXECUTABLES)
include $$(BUILD_PREBUILT)
endef


prebuilt_ducati_vendor_fw := \
	firmware/ducati-m3.bin

prebuilt_ducati_dcc := \
	camera/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN003_DCCID1042/cid1042_ov5640_vnf_cfg_dcc.bin \
	camera/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN003_DCCID1042/cid1042_ov5640_ducati_nsf_ldc.bin \
	camera/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN003_DCCID1042/cid1042_ov5640_capabilities.bin \
	camera/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN003_DCCID1042/cid1042_ov5640_ldc_cfg_dcc.bin \
	camera/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN003_DCCID1042/cid1042_ov5640_face_detect_dcc.bin \
	camera/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN003_DCCID1042/cid1042_ov5640_face_tracking_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_isif_csc_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_nf2_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_lsc_poly_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_h3a_aewb_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_af_caf_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_awb_alg_mms2_tuning.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_gbce_sw1_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_rgb2rgb_1_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_af_affw_dcc_tuning.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_gic_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_cgs_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_isif_clamp_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_awb_alg_ti3_tuning.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_iss_vstab_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_gbce_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_af_saf_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ducati_eff_tun.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_iss_glbce3_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_ae_mms2_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ldc_cac_cfg_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_nf1_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_ee_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_rgb2yuv_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_rgb2rgb_2_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_vnf_cfg_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_3d_lut_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ducati_gamma.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_kgen_dcc_preflash.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_vss_sac_smac_cfg_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_ae_ti2_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_face_tracking_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_iss_lbce_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_af_hllc_dcc_tuning.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_cfai_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_af_caf_dcc_tuning.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_car_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_af_saf_dcc_tuning.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ducati_lsc_2d.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ducati_awb_ti2_tun.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_dpc_otf.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_iss_scene_modes_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ducati_nsf_ldc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ldc_cfg_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_rsz_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_face_detect_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_yuv444_to_yuv422_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_ipipe_dpc_lut_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_af_affw_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_adjust_rgb2rgb_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_ae_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_alg_3a_af_hllc_dcc.bin \
	camera/R12_MVEN001_LD1_ND0_IR0_SH0_FL0_SVEN001_DCCID43/cid43_imx060_capabilities.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_gbce_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_capabilities.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_awb_alg_ti3_tuning.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_ae_mms2_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_iss_lbce_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_nf1_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ducati_eff_tun.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_rgb2yuv_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_isif_clamp_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_rsz_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ducati_awb_ti2_tun.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_vss_sac_smac_cfg_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_cgs_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_af_hllc_dcc_tuning.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_iss_scene_modes_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_dpc_lut_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_face_tracking_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_adjust_rgb2rgb_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_yuv444_to_yuv422_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_rgb2rgb_2_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_ee_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_af_saf_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_isif_csc_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_car_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_ae_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_face_detect_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_3d_lut_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ducati_lsc_2d.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_af_caf_dcc_tuning.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_dpc_otf.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_af_hllc_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_rgb2rgb_1_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_af_affw_dcc_tuning.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_cfai_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ducati_gamma.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_af_caf_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ducati_nsf_ldc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_h3a_aewb_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_af_affw_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_iss_vstab_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_nf2_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_lsc_poly_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_ae_ti2_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ldc_cfg_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_iss_glbce3_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_alg_3a_af_saf_dcc_tuning.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ldc_cac_cfg_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_ipipe_gic_dcc.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_kgen_dcc_preflash.bin \
	camera/R12_MVEN002_LD2_ND0_IR0_SH0_FL0_SVEN002_DCCID42/cid42_ov5650_vnf_cfg_dcc.bin

prebuilt_ducati_modules := \
  $(foreach _file,$(prebuilt_ducati_vendor_fw) $(prebuilt_ducati_dcc), \
    $(notdir $(basename $(_file))))

include $(CLEAR_VARS)
LOCAL_MODULE := ti_omap4_ducati_libs
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(prebuilt_ducati_modules)
include $(BUILD_PHONY_PACKAGE)

$(foreach _file,$(prebuilt_ducati_vendor_fw),\
  $(eval $(call _add-ducati-vendor-fw,$(_file))))

$(foreach _file,$(prebuilt_ducati_dcc),\
  $(eval $(call _add-ducati-dcc,$(_file))))

prebuilt_ducati_modules :=
prebuilt_ducati_vendor_fw :=
_add-ducati-vendor-fw :=
_add-ducati-dcc :=
