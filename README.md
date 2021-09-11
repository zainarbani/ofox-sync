# Sync the twrp Android 10.0 or 11.0 minimal manifest and patch it for building OrangeFox for native Android 10/Android 11 devices

## To fetch the manifest for the first time, follow these steps: ##
------------------------------------

### 1. Fetch these sync tools (for the 11.0 manifest, change "10" to "11") ###
	mkdir ~/OrangeFox_10
	cd ~/OrangeFox_10
	git clone https://gitlab.com/OrangeFox/sync.git (or, using ssh, "git clone git@gitlab.com:OrangeFox/sync.git")

### 2. Do the syncing (this can take up to 1 hour, and can use up to 40GB of disk space) ##
	cd ~/OrangeFox_10/sync
	./get_fox_10.sh ~/OrangeFox_10/fox_10.0
Notes:
- If the sync process gets stuck, you might need to terminate it with Ctrl-C and then run the script again
- If you want to use ssh for cloning the OrangeFox sources and vendor tree, export "USE_SSH=1" before starting

## To update the manifest (10.0 only), recovery sources, and vendor trees, follow these steps: ##
----------------------------------
	cd ~/OrangeFox_10/sync
	./update_fox_10.sh ~/OrangeFox_10/fox_10.0

## To update only the recovery sources, follow these steps: ##
----------------------------------
	cd ~/OrangeFox_10/fox_10.0/bootable/recovery
	git pull

## To update only the vendor tree, follow these steps: ##
----------------------------------
	cd ~/OrangeFox_10/fox_10.0/vendor/recovery
	git pull

### 3. To build, using a trivial sample build script, follow these steps: ###
----------------------------------
	cd ~/OrangeFox_10/sync
	./build_fox.sh <device_codename>
(make sure that you have cloned your device tree to the correct place before doing this!)

## Notes on fox_11.0 ##
- The fox_11.0 sources are not ready. The "11.0" sync code here is just a placeholder for when the fox_11.0 sources are released.
- If you try to clone the fox_11.0 sources now, the process will eventually terminate with an error.
