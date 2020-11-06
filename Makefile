prepare: download openwrt-patch openwrt-prepare

download: openwrt-19.07.3 submodules

openwrt-19.07.3:
	git clone https://github.com/openwrt/openwrt.git --depth 1 -b v19.07.3 openwrt-19.07.3

submodules:
	git submodule update --init --recursive 

openwrt-prepare:
	cd openwrt; \
		./scripts/feeds update -a; \
		./scripts/feeds install -a;

openwrt-patch:
	rm -rf ./openwrt/target/linux
	cp -r ./openwrt-overlay/* ./openwrt
