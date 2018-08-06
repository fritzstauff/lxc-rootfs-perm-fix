#!/bin/bash

#change the variables below to match your circumstances
#Tested on ubuntu14 container

source_passwd='/var/lib/lxd/storage-pools/lxd-storage/containers/containername/rootfs/etc/passwd'
starting_uid=100000
directory='/var/lib/lxd/storage-pools/lxd-storage/containers/containername/rootfs/diretory/'

for uid in `cat $source_passwd | cut -d : -f 3`; do
    echo $newuid
    newuid=$(($uid + $starting_uid))
    find $directory -uid $uid -exec chown $newuid {} +
done
