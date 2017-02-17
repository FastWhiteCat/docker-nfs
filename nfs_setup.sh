#!/bin/bash

set -e

mounts="${@}"

echo "/exports *(rw,sync,no_subtree_check,fsid=0,no_root_squash)" >> /etc/exports

exec runsvdir /etc/sv