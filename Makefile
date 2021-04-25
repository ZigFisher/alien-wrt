prepare: download openwrt-patch openwrt-prepare

download: openwrt-19.07.3 submodules

openwrt-19.07.3:
	git clone https://github.com/openwrt/openwrt.git --depth 1 -b v19.07.3 openwrt-19.07.3

submodules:
	git submodule update --init --recursive

openwrt-patch:
	rm -rf ./openwrt-19.07.3/target/linux
	cp -r ./openwrt-19.07.3-overlay/* ./openwrt-19.07.3
	#
	patch -p1 < ./files/03_toolchain_fix.patch
	cp -av ./files/config_hi3516ev300 ./openwrt-19.07.3/.config

openwrt-prepare:
	cd openwrt-19.07.3; \
		./scripts/feeds update -a; \
		./scripts/feeds install -a; \


