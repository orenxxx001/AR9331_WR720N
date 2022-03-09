#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 更改默认密码
sed -i 's/root::0:0:99999:7:::/root:$1$MhPcOOTE$DOOyDUwKjP9xnoSfaczsk.:19058:0:99999:7:::/g' package/base-files/files/etc/shadow

# 修改默认IP
sed -i 's/192.168.1.1/192.168.88.8/g' package/base-files/files/bin/config_generate

# 修改hostname
sed -i 's/OpenWrt/XinV-2.0/g' package/base-files/files/bin/config_generate

wifi_name='RR'
wifi_encryption='psk2'
wifi_password='23456789DDop'

echo "修改wifi名称"
sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
echo "修改wifi加密方式"
sed -i "s/none/$wifi_encryption/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
echo "修改wifi加密密码"
sed -i '/set wireless.default_radio${devidx}.encryption=none/aset wireless.default_radio${devidx}.key=$wifi_password' package/kernel/mac80211/files/lib/wifi/mac80211.sh
