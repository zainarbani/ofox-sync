# Sync twrp-10.0 minimal manifest and patch it for building OrangeFox

## To fetch the manifest for the first time, follow these steps: ##
------------------------------------

### 1. Fetch these sync tools ###
	git clone git@gitlab.com:OrangeFox/sync.git

### 2. Do the syncing (this can take up to 1 hour, and can use up to 44GB disk space) ##
	cd sync
	./get_fox_10.sh

## To update the manifest, recovery sources, and vendor trees, follow these steps: ##
----------------------------------
	cd sync
	./update_fox_10.sh [fox_10_manifest_directory]

