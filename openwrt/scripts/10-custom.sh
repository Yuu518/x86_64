#!/bin/bash

# add mihomo
git clone https://$github/morytyann/openwrt-mihomo package/new/openwrt-mihomo
rm -rf package/new/helloworld/luci-app-mihomo
rm -rf package/new/helloworld/mihomo
if curl -s "https://$mirror/openwrt/23-config-common" | grep -q "^CONFIG_PACKAGE_luci-app-mihomo=y"; then
    mkdir -p files/etc/mihomo/run/ui
    curl -Lso files/etc/mihomo/run/geoip.metadb https://$github/MetaCubeX/meta-rules-dat/releases/download/latest/geoip-lite.metadb
    curl -Lso files/etc/mihomo/run/ASN.mmdb https://$github/xishang0128/geoip/releases/download/latest/GeoLite2-ASN.mmdb
    curl -Lso metacubexd-gh-pages.tar.gz https://$github/MetaCubeX/metacubexd/archive/refs/heads/gh-pages.tar.gz
    tar zxf metacubexd-gh-pages.tar.gz
    rm metacubexd-gh-pages.tar.gz
    mv metacubexd-gh-pages files/etc/mihomo/run/ui/metacubexd
fi

# add ddns-go
git clone https://$github/sirpdboy/luci-app-ddns-go package/new/ddns-go