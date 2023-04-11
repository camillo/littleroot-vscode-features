#!/bin/sh

download_dir=$(mktemp -d)
hcloud_version=$(curl -s -I https://github.com/hetznercloud/cli/releases/latest/ | grep -Fi location: | egrep -o 'v[0-9.]+')
echo "download version ${hcloud_version}"
download_url="https://github.com/hetznercloud/cli/releases/download/${hcloud_version}/hcloud-linux-amd64.tar.gz"
wget ${download_url} --directory-prefix=${download_dir} --quiet
    
tar zxf ${download_dir}/hcloud-linux-amd64.tar.gz --directory ${download_dir}
install ${download_dir}/hcloud /usr/local/bin
echo "cleanup..."
rm -rf $download_dir

echo installed $(hcloud version)
