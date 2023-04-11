#!/bin/sh

hcloud_package="hcloud-linux-amd64.tar.gz"
download_dir=$(mktemp -d)

wget https://github.com/hetznercloud/cli/releases/latest/download/${hcloud_package} --directory-prefix=${download_dir} --quiet    
tar zxf ${download_dir}/${hcloud_package} --directory ${download_dir}
install ${download_dir}/hcloud /usr/local/bin

rm -rf $download_dir

echo installed $(hcloud version)
