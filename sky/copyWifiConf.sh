#! /system/bin/sh

TAG_FILE1="/data/misc/wifi/wpa_supplicant_7601.conf"
TAG_FILE2="/data/misc/wifi/p2p_supplicant_7601.conf"
TAG_FILE3="/data/vendor_tag1"
TAG_FILE4="/data/vendor_tag2"


if [ ! -f "$TAG_FILE1" ]; then
	echo "copy wpa_supplicant_7601 conf ...1"
	/system/bin/cp  /system/etc/wifi/wpa_supplicant_overlay.conf  /data/misc/wifi/wpa_supplicant_7601.conf -rf
	echo "copy wpa_supplicant_7601 conf complete">$TAG_FILE3
	echo "copy wpa_supplicant_7601 conf ...2"
fi

if [ ! -f "$TAG_FILE2" ]; then
	echo "copy p2p_supplicant_7601 conf ...1"
	/system/bin/cp  /system/etc/wifi/p2p_supplicant_overlay.conf  /data/misc/wifi/p2p_supplicant_7601.conf -rf
	echo "copy p2p_supplicant_7601 conf complete">$TAG_FILE4
	echo "copy p2p_supplicant_7601 conf ...2"
fi




