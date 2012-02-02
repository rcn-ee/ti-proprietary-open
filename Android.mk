LOCAL_PATH := $(my-dir)
$(hide $(shell $(LOCAL_PATH)/untar.sh $(LOCAL_PATH)/omap4 sgx $(LOCAL_PATH)/omap4/sgx.tgz))
$(hide $(shell $(LOCAL_PATH)/untar.sh $(LOCAL_PATH)/wl12xx wpan $(LOCAL_PATH)/wl12xx/wpan.tgz))
include $(call all-subdir-makefiles)
