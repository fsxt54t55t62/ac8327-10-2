#
# Copyright (C) 2014 MediaTek Inc.
# Modification based on code covered by the mentioned copyright
# and/or permission notice(s).
#
# Copyright 2006 The Android Open Source Project

ifeq ($(ATC_CHIP_DYNAMIC),true)
$(warning "[scott]ATC_CHIP_DYNAMIC is define")
LOCAL_CFLAGS += -DWLAN_CHIP_DYNAMIC
endif

ifneq ($(filter ATC_CHIP_MT6630,$(ATC_CHIP_ID)),)
$(warning "[scott]WLAN_CHIP_MT6630 is define")
LOCAL_CFLAGS += -DWLAN_CHIP_MT6630

else
$(warning "[scott] WLAN_CHIP_MT6630 is not define")
LOCAL_CFLAGS += -DWLAN_INSMOD_DYNAMIC
endif

ifeq ($(ATC_WLAN_CHIP), ATC_WLAN_MT7601) 
LOCAL_CFLAGS += -DATC_WLAN_MT7601
$(warning "[scott] ATC_WLAN_MT7601 is define")
endif

ifdef WIFI_DRIVER_MODULE_PATH
LOCAL_CFLAGS += -DWIFI_DRIVER_MODULE_PATH=\"$(WIFI_DRIVER_MODULE_PATH)\"
endif
ifdef WIFI_DRIVER_MODULE_ARG
LOCAL_CFLAGS += -DWIFI_DRIVER_MODULE_ARG=\"$(WIFI_DRIVER_MODULE_ARG)\"
endif
ifdef WIFI_DRIVER_MODULE_NAME
LOCAL_CFLAGS += -DWIFI_DRIVER_MODULE_NAME=\"$(WIFI_DRIVER_MODULE_NAME)\"
endif
ifdef WIFI_FIRMWARE_LOADER
LOCAL_CFLAGS += -DWIFI_FIRMWARE_LOADER=\"$(WIFI_FIRMWARE_LOADER)\"
endif
ifdef WIFI_DRIVER_FW_PATH_STA
LOCAL_CFLAGS += -DWIFI_DRIVER_FW_PATH_STA=\"$(WIFI_DRIVER_FW_PATH_STA)\"
endif
ifdef WIFI_DRIVER_FW_PATH_AP
LOCAL_CFLAGS += -DWIFI_DRIVER_FW_PATH_AP=\"$(WIFI_DRIVER_FW_PATH_AP)\"
endif
ifdef WIFI_DRIVER_FW_PATH_P2P
LOCAL_CFLAGS += -DWIFI_DRIVER_FW_PATH_P2P=\"$(WIFI_DRIVER_FW_PATH_P2P)\"
endif
ifdef WIFI_DRIVER_FW_PATH_PARAM
LOCAL_CFLAGS += -DWIFI_DRIVER_FW_PATH_PARAM=\"$(WIFI_DRIVER_FW_PATH_PARAM)\"
endif

ifdef WIFI_DRIVER_STATE_CTRL_PARAM
LOCAL_CFLAGS += -DWIFI_DRIVER_STATE_CTRL_PARAM=\"$(WIFI_DRIVER_STATE_CTRL_PARAM)\"
endif
ifdef WIFI_DRIVER_STATE_ON
LOCAL_CFLAGS += -DWIFI_DRIVER_STATE_ON=\"$(WIFI_DRIVER_STATE_ON)\"
endif
ifdef WIFI_DRIVER_STATE_OFF
LOCAL_CFLAGS += -DWIFI_DRIVER_STATE_OFF=\"$(WIFI_DRIVER_STATE_OFF)\"
endif

LOCAL_C_INCLUDES +=  \
	$(ANDROID_BUILD_TOP)/kernel/kernel-3.18/include/misc/atc/metazone/

LOCAL_SHARED_LIBRARIES := libc libcutils libmetazone

ifdef MTK_WLAN_7601_SUPPORT
LOCAL_SRC_FILES += wifi/wifi_7601.c
else
LOCAL_SRC_FILES += wifi/wifi.c
endif

ifdef WPA_SUPPLICANT_VERSION
LOCAL_CFLAGS += -DLIBWPA_CLIENT_EXISTS
LOCAL_SHARED_LIBRARIES += libwpa_client
endif
LOCAL_SHARED_LIBRARIES += libnetutils

#ifeq ($(MTK_HOTSPOT_MGR_SUPPORT), yes)
LOCAL_CFLAGS += -DCONFIG_HOTSPOT_MGR_SUPPORT
#endif
LOCAL_CFLAGS += -DCONFIG_MEDIATEK_DEBUG