# !/bin/bash
# Updates go version and keeps a backup of old go.
go_location="/usr/local/go"
go_present=$(command -v go)
if [ -z "$1" ]; then
    echo "Please provide go archive."
    exit 1;
fi
echo $go_present
if [ ! -z "$go_present" ]; then
    go_current_version=$(go version | grep -P 'go(\d\.?)+' -o | awk '{print substr($0,3)}')
    sudo mv $go_location $go_location"."$go_current_version
fi
if [ ! -z "$2" ]; then
    go_location=$2
fi
sudo tar -C /usr/local -xzf $1
