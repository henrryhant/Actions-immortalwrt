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
sed -i "/^PKG_VERSION:=/cPKG_VERSION:=1.2022.40" feeds/packages/net/smartdns/Makefile
sed -i "/^PKG_SOURCE:=/cPKG_SOURCE_PROTO:=git" feeds/packages/net/smartdns/Makefile
sed -i "/^PKG_SOURCE_URL:=/cPKG_SOURCE_URL:=https://www.github.com/pymumu/smartdns.git" feeds/packages/net/smartdns/Makefile
sed -i "/^PKG_HASH:=/cPKG_SOURCE_VERSION:=db56472b845b12d47f59e63aa8411bdca3a6f004" feeds/packages/net/smartdns/Makefile
sed -i "s/PKG_BUILD_DIR/#PKG_BUILD_DIR/" feeds/packages/net/smartdns/Makefile
sed -i "50i     \$(INSTALL_DIR) \$(1)/etc/smartdns \$(1)/etc/smartdns/domain-set \$(1)/etc/smartdns/conf.d/" feeds/packages/net/smartdns/Makefile
