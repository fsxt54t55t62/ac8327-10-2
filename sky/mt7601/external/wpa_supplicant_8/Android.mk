LOCAL_PATH:= $(call my-dir)
#WPA_SUPPLICANT_VERSION := VER_0_8_X
#ifeq ($(BOARD_WLAN_DEVICE), MediaTek)
L_CFLAGS += -DUSE_WLAN_DEVICE_MTK
#endif
#ifndef WPA_SUPPLICANT_VERSION
#WPA_SUPPLICANT_VERSION := VER_0_8_X
#endif
ifneq ($(filter VER_0_8_X VER_2_1_DEVEL,$(WPA_SUPPLICANT_VERSION)),)
# The order of the 2 Android.mks does matter!
# TODO: Clean up the Android.mks, reset all the temporary variables at the
# end of each Android.mk, so that one Android.mk doesn't depend on variables
# set up in the other Android.mk.
include $(LOCAL_PATH)/hostapd/Android.mk \
        $(LOCAL_PATH)/wpa_supplicant/Android.mk
endif
