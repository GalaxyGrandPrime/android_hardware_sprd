#
# Copyright (C) 2008 The Android Open Source Project
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

CUR_DIR := tool

LOCAL_C_INCLUDES += \
                $(LOCAL_PATH)/$(CUR_DIR)/auto_test/inc \
                $(LOCAL_PATH)/$(CUR_DIR)/mtrace

LOCAL_SRC_DIR := $(LOCAL_PATH)/$(CUR_DIR)

LOCAL_SRC_FILES += $(shell find $(LOCAL_SRC_DIR) -name '*.c' | sed s:^$(LOCAL_PATH)/::g )
LOCAL_SRC_FILES += $(shell find $(LOCAL_SRC_DIR) -name '*.cpp' | sed s:^$(LOCAL_PATH)/::g )
