# --------------------------------------------------------------------
# configuration files for AOSP wpa_supplicant_8
# --------------------------------------------------------------------
ifeq ($(WPA_SUPPLICANT_VERSION),VER_0_8_X)
WPA_SUPPLICANT_BUILD := yes
endif

ifeq ($(WPA_SUPPLICANT_VERSION),VER_0_8_X_MTK)
WPA_SUPPLICANT_BUILD := yes
endif

ifeq ($(WPA_SUPPLICANT_BUILD), yes)
########################
local_target_dir := $(TARGET_OUT)/etc/wifi
local_target_data_dir:= $(TARGET_OUT_DATA)/misc/wifi
$(warning 1-- target_out=$(TARGET_OUT))
LOCAL_PATH := $(call my-dir)

#################Add overlay file################
$(warning 2-- target_out=$(TARGET_OUT))
include $(CLEAR_VARS)
LOCAL_MODULE := wpa_supplicant_overlay.conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(local_target_dir)
LOCAL_SRC_FILES := MT7601-wpa_supplicant-overlay.conf
include $(BUILD_PREBUILT)

$(warning 3-- target_out=$(TARGET_OUT))
include $(CLEAR_VARS)
LOCAL_MODULE := p2p_supplicant_overlay.conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(local_target_dir)
LOCAL_SRC_FILES := MT7601-p2p_supplicant-overlay.conf
include $(BUILD_PREBUILT)

$(warning 4-- target_out=$(TARGET_OUT_DATA))
include $(CLEAR_VARS)
LOCAL_MODULE := wpa_supplicant_7601.conf
LOCAL_MODULE_CLASS := MISC
LOCAL_MODULE_PATH := $(local_target_data_dir)
LOCAL_SRC_FILES := MT7601-wpa_supplicant-overlay.conf
include $(BUILD_PREBUILT)

$(warning 5-- target_out=$(TARGET_OUT_DATA))
include $(CLEAR_VARS)
LOCAL_MODULE := p2p_supplicant_7601.conf
LOCAL_MODULE_CLASS := MISC
LOCAL_MODULE_PATH := $(local_target_data_dir)
LOCAL_SRC_FILES := MT7601-p2p_supplicant-overlay.conf
include $(BUILD_PREBUILT)
endif #ifeq($(WPA_SUPPLICANT_VERSION),VER_0_8_X)