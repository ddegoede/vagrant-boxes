# Packer cache

```packer``` creates a directory called ```packer_cache``` in the working directory you are when ```packer``` is run. If you want to store all the downloaded ISO files in one directory it can be set with the env variable ```PACKER_CACHE_DIR```.

```download_isos.sh``` will download all the ISO files contained in the ```iso.txt``` file and will store them in the current directory (```packer_cache```) so when ```packer build``` is run they will be already downloaded.
