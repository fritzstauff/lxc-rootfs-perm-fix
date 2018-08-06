#!/bin/bash

#Tested on ubuntu14 container
#change the variables below to match your circumstances


source_passwd='/var/lib/lxd/storage-pools/lxd-storage/containers/containername/rootfs/etc/passwd'
starting_gid=100000
directory='/var/lib/lxd/storage-pools/lxd-storage/containers/containername/rootfs/diretory/'

for gid in `cat $source_passwd | cut -d : -f 4`; do
    newgid=$(($gid + $starting_gid))
    find $directory -gid $gid -exec chgrp $newgid {} + ;done
done
