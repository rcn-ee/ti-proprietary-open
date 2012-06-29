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

# Add WLAN firmware - Define the tgz to be unpacked, and enable the
# WLAN firmware package, which is defined in the top-level Android.mk
# of the proprietary-open tree

WLAN_TGZ := device/ti/proprietary-open/wl12xx/wlan/wlan.tgz
PRODUCT_PACKAGES += \
        wl128x-fw-4-mr.bin \
        wl128x-fw-4-plt.bin \
        wl128x-fw-4-sr.bin \
        wl127x-fw-4-mr.bin \
        wl127x-fw-4-plt.bin \
        wl127x-fw-4-sr.bin \
        wl1271-nvs.bin \
        wl1271-nvs_127x.bin
