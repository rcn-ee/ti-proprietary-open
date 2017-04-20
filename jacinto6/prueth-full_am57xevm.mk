# Copyright (C) 2012 The Android Open Source Project
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

# Add PRU Ethernet - Define the tgz to be unpacked, and enable the
# prueth package, which is defined in the top-level Android.mk
# of the proprietary-open tree

ifeq ($(TARGET_PRODUCT),$(filter $(TARGET_PRODUCT),full_am57xevm))
PRUETH_TGZ := device/ti/proprietary-open/jacinto6/prueth_full_am57xevm.tgz
PRODUCT_PACKAGES += \
	am57xx-pru0-prueth-fw.elf \
	am57xx-pru1-prueth-fw.elf
endif
