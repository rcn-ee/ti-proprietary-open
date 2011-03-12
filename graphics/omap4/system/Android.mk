##
## Copyright 2010, Texas Instruments.   All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions
## are met:
##  * Redistributions of source code must retain the above copyright
##    notice, this list of conditions and the following disclaimer.
##  * Redistributions in binary form must reproduce the above copyright
##    notice, this list of conditions and the following disclaimer in the
##    documentation and/or other materials provided with the distribution.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
## EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
## CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
## EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
## PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
## PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
## OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
## (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
## OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##

ifeq ($(TARGET_BOARD_PLATFORM),omap4)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

define local-transform-link-to-target
@echo "$(if $(PRIVATE_IS_HOST_MODULE),host,target) Prebuilt: $(PRIVATE_MODULE) ($@)"
$(hide) rm -f $@
$(hide) ln -s `basename $<` $@
endef

# find the library version number
library_version := $(shell \
    echo "$(wildcard $(LOCAL_PATH)/vendor/lib/libIMGegl.so.*)" | \
    sed "s%.*libIMGegl[.]so[.]\(.*\)%\1%" \
    )

copy_lib_files_from := \
    $(wildcard $(LOCAL_PATH)/vendor/lib/*.so.*) \
    $(wildcard $(LOCAL_PATH)/vendor/lib/egl/*.so.*) \
    $(wildcard $(LOCAL_PATH)/vendor/lib/hw/*.so.*)
copy_lib_files_to := $(copy_lib_files_from:$(LOCAL_PATH)/%=$(TARGET_OUT)/%)

libs_to_link := $(copy_lib_files_to:%.$(library_version)=%)

misc_files_from := \
    $(LOCAL_PATH)/bin/pvrsrvinit
misc_files_to := $(misc_files_from:$(LOCAL_PATH)/%=$(TARGET_OUT)/%)

copy_files_to := \
    $(copy_lib_files_to) \
    $(libs_to_link) \
    $(misc_files_to)

$(copy_lib_files_to): $(TARGET_OUT)/% : $(LOCAL_PATH)/% | $(ACP)
    $(transform-prebuilt-to-target)

$(misc_files_to): $(TARGET_OUT)/% : $(LOCAL_PATH)/% | $(ACP)
    $(transform-prebuilt-to-target)

$(libs_to_link): % : %.$(library_version)
    $(local-transform-link-to-target)


ALL_PREBUILT += $(copy_files_to)

endif
