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

########### 修改默认 IP ###########
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate

########### 设置密码为空（可选） ###########
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

########### 更新smartdns版本 ###########
rm -rf feeds/packages/net/smartdns
git clone https://github.com/pymumu/openwrt-smartdns.git feeds/packages/net/smartdns
sed -i "/^PKG_SOURCE_VERSION:=/cPKG_SOURCE_VERSION:=3c7b86eea755cf726a49d452a7b43ceeb01f2a06" feeds/packages/net/smartdns/Makefile
rm -rf feeds/luci/applications/luci-app-smartdns
git clone https://github.com/pymumu/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns

rm -rf feeds/luci/applications/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci-smartdns-new-version/luci-app-passwall feeds/luci/applications/luci-app-passwall
