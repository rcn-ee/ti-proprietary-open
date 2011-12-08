LOCAL_PATH := $(my-dir)
$(hide $(shell $(LOCAL_PATH)/untar.sh $(LOCAL_PATH)/omap4 sgx $(LOCAL_PATH)/omap4/sgx.tgz))
include $(call all-subdir-makefiles)
