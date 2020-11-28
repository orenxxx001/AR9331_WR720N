#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '$a src-git ifit https://github.com/kenzok8/luci-theme-ifit.git' feeds.conf.default

# Add OpenAppFilter
cd package
git clone https://github.com/destan19/OpenAppFilter.git
cd -

# Delete SFE
rm package/lean/luci-app-flowoffload -fr
rm package/lean/shortcut-fe/ -fr
rm package/lean/luci-app-sfe/ -fr

# Add Argon Theme
cd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
cd ..
cd ..
